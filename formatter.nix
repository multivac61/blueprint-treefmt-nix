{
  flake,
  inputs,
  pkgs,
  ...
}:
let
  treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs ./treefmt.nix;
  formatter = treefmtEval.config.build.wrapper;
  foo = 1;
in
formatter
// {
  meta = formatter.meta // {
    tests = {
      check = treefmtEval.config.build.check flake; # Check the whole repo
    };
  };
}
