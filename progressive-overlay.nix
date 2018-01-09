self: super:
let
  p_override = pself: psuper: rec {
    progressive = psuper.buildPythonPackage rec {
      version = "0.3.4";
      pname = "progressive";
      name = "${pname}-${version}";
      # src = psuper.fetchPypi rec {
      #   inherit pname version;
      #   format = "wheel";
      #   python = "py2";
      #   sha256 = "0vvwsh3waxd5ldrayr86kdcshv07bp361fl7p16g9i044vklwly4";
      # };
      src = super.fetchgit {
        url = https://github.com/hfaran/progressive.git;
        sha256 = "0666ggbm0vp1jxn935wd6352xvc5r8zy27flqrydff1q14lgsipx";
      };
      propagatedBuildInputs = [ psuper.blessings ];
    };
  };
in rec
{
  python36   = super.python36.override { packageOverrides = p_override; };
  python36Packages = python36.pkgs;
}
