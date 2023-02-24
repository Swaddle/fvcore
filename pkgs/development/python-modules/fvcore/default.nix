{ stdenv
, lib
, buildPythonPackage
, fetchFromGitHub
, pythonOlder
, pytestCheckHook
, iopath
, numpy
, pillow
, pyyaml
, shapely
, tabulate
, termcolor
, torch
, torchvision
, tqdm
, yacs
}:

buildPythonPackage rec {
  pname = "fvcore";
  disabled = pythonOlder "3.6";
  version = "0.1.5";

  src = fetchFromGitHub {
    owner = "facebookresearch";
    repo = "fvcore";
    rev = "6bde555";
    sha256 = "1vz9qif5iaxhwks5mhg9lrfr16aj5kb108dgphhcv0iq4nla2wsa";
  };

  nativeBuildInputs = [
    iopath
    numpy
    pillow
    pyyaml
    tabulate
    termcolor
    tqdm
    yacs
  ];

  propagatedBuildInputs = [
    torch
    shapely
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pytestFlagsArray = [
    "tests"
  ];

  pythonImportsCheck = [
    "fvcore"
    "fvcore.nn"
  ];

  meta = with lib; {
    description = "Collection of common code that's shared among different research projects in FAIR computer vision team";
    homepage = "https://github.com/facebookresearch/fvcore";
    license = licenses.asl20;
    maintainers = with maintainers; [ swaddle ];
  };
}
