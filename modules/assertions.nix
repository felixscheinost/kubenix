{ lib, ... }: {
  options = with lib; {
    assertions = mkOption {
      type = types.listOf (types.submodule {
        options = {
          assertion = mkOption {
            description = "assertion value";
            type = types.bool;
            default = false;
          };

          message = mkOption {
            description = "assertion message";
            type = types.str;
          };
        };
      });
      default = [ ];
      example = [{
        assertion = false;
        message = "you can't enable this for that reason";
      }];
      description = ''
        This option allows modules to express conditions that must
        hold for the evaluation to succeed, along with associated error messages for the user.
      '';
    };
  };
  # impl of assertions is in <nixpkgs/nixos/modules/system/activation/top-level.nix>
}
