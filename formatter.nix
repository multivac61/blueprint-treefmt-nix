{
  flake,
  inputs,
  pkgs,
  ...
}:
let
  treefmtEval = inputs.treefmt-nix.lib.evalModule pkgs {
    projectRootFile = "flake.nix";

    programs.deadnix.enable = true;
    programs.nixfmt.enable = true;

    programs.alejandra.enable = true;

    programs.shellcheck.enable = true;
    programs.shfmt.enable = true;
    settings.formatter.shfmt.includes = [
      "*.envrc"
      "*.envrc.private-template"
      "*.bashrc"
      "*.bash_profile"
      "*.bashrc.load"
    ];

    settings.formatter.deadnix.pipeline = "nix";
    settings.formatter.deadnix.priority = 1;
    settings.formatter.nixfmt.pipeline = "nix";
    settings.formatter.nixfmt.priority = 2;
    settings.formatter.nixfmt.strict = true;

    settings.formatter.shellcheck.pipeline = "shell";
    settings.formatter.shellcheck.priority = 1;
    settings.formatter.shfmt.pipeline = "shell";
    settings.formatter.shfmt.priority = 2;

    settings.global.excludes = [
      "*.png"
      "*.jpg"
      "*.zip"
      "*.touchosc"
      "*.pdf"
      "*.svg"
      "*.ico"
      "*.webp"
      "*.gif"
    ];
  };
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
