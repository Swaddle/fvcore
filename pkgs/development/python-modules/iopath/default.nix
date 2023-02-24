{ stdenv
, lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, python
, portalocker
, tqdm
}:

buildPythonPackage rec {
  pname = "iopath";
  version = "v0.1.9";
  disabled = pythonOlder "3.6";

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "iopath";
    rev = version;
    sha256 = "1kz6xqzxchcjm8fnhd5c0aavh35g379scs45yhrhcclacpzdzrj2";
  };

  propagatedBuildInputs = [
    portalocker
    tqdm
  ];

  # tests depend on other packages like torch
  doCheck = false;

  pythonImportsCheck = [
    "iopath"
  ];

  meta = with lib; {
    description = " A python library that provides common I/O interface across different storage backends";
    homepage = "https://github.com/facebookresearch/iopath";
    license = licenses.mit;
    maintainers = with maintainers; [ swaddle ];
  };
}
