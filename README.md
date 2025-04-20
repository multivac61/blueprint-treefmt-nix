# Update

I managed to get all examples working by changing

```console
formatter
// {
  meta = formatter.meta // {
    tests = {
      check = check;
    };
  };
}
```


to 

```console
formatter
// {
  passthru = formatter.passthru // {
    tests = {
      check = check;
    };
  };
}
```


There must have been a change made to blueprint from `meta` to `passthru`.

---

This is an example repo documenting my attempts to get checks from `treefmt-nix` into `nix flake check`. So far I have been unsuccessful integrating it into the `formatter.nix` file blueprint uses by default for formatters. 

I deliberately left couple of formatting issues in `flake.nix` and some deadnix code. Expected behaviour is for the [garnix CI](https://garnix.io) **not to pass** (see pull-requests).

> There is an active issue on both [treefmt-nix](https://github.com/numtide/treefmt-nix/issues/317) and [blueprint](https://github.com/numtide/blueprint/issues/31). 

## ✅ overriding-flake.outputs

By overriding the `flake.outputs` attribute using example from [treefmt-nix README](https://github.com/numtide/treefmt-nix?tab=readme-ov-file#flakes), `nix flake check` works.

```console
blueprint-treefmt-nix on  overriding-flake.outputs via ❄️  impure (nix-shell-env)
❯ nix flake show --all-systems
git+file:///Users/olafur/dev/multivac61/blueprint-treefmt-nix?ref=refs/heads/overriding-flake.outputs&rev=7d0ab2eb56c137059635d6f4236b5c2c1fe5a422
├───__functor: unknown
├───checks
│   ├───aarch64-darwin
│   │   └───formatting: derivation 'treefmt-check'
│   ├───aarch64-linux
│   │   └───formatting: derivation 'treefmt-check'
│   ├───x86_64-darwin
│   │   └───formatting: derivation 'treefmt-check'
│   └───x86_64-linux
│       └───formatting: derivation 'treefmt-check'
├───darwinConfigurations: unknown
├───darwinModules: unknown
├───devShells
│   ├───aarch64-darwin
│   │   └───default: development environment 'nix-shell'
│   ├───aarch64-linux
│   │   └───default: development environment 'nix-shell'
│   ├───x86_64-darwin
│   │   └───default: development environment 'nix-shell'
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   ├───aarch64-darwin: package 'treefmt'
│   ├───aarch64-linux: package 'treefmt'
│   ├───x86_64-darwin: package 'treefmt'
│   └───x86_64-linux: package 'treefmt'
├───homeModules: unknown
├───lib: unknown
├───modules: unknown
├───systemConfigs: unknown
└───templates
```



## ❌ zimbatim-home-version

Using example taken from [zimbatm/home](https://github.com/zimbatm/home/blob/main/packages/formatter/default.nix) we are unable to get `nix flake check` to work

```console
blueprint-treefmt-nix on  zimbatim-home-version via ❄️  impure (nix-shell-env)
❯ nix flake show --all-systems
git+file:///Users/olafur/dev/multivac61/blueprint-treefmt-nix?ref=refs/heads/zimbatim-home-version&rev=3ebe3dae7edd170847565b120d4de83c800d3fb2
├───__functor: unknown
├───checks
│   ├───aarch64-darwin
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   ├───aarch64-linux
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   ├───x86_64-darwin
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   └───x86_64-linux
│       ├───devshell-default: derivation 'nix-shell'
│       └───pkgs-formatter: derivation 'treefmt'
├───darwinConfigurations: unknown
├───darwinModules: unknown
├───devShells
│   ├───aarch64-darwin
│   │   └───default: development environment 'nix-shell'
│   ├───aarch64-linux
│   │   └───default: development environment 'nix-shell'
│   ├───x86_64-darwin
│   │   └───default: development environment 'nix-shell'
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   ├───aarch64-darwin: package 'treefmt'
│   ├───aarch64-linux: package 'treefmt'
│   ├───x86_64-darwin: package 'treefmt'
│   └───x86_64-linux: package 'treefmt'
├───homeModules: unknown
├───lib: unknown
├───modules: unknown
├───packages
│   ├───aarch64-darwin
│   │   └───formatter: package 'treefmt'
│   ├───aarch64-linux
│   │   └───formatter: package 'treefmt'
│   ├───x86_64-darwin
│   │   └───formatter: package 'treefmt'
│   └───x86_64-linux
│       └───formatter: package 'treefmt'
├───systemConfigs: unknown
└───templates
```


## ❌ formatter-nix

Using a combination of both above we are unable to get `nix flake check` to work.

```console
blueprint-treefmt-nix on  formatter-nix via ❄️  impure (nix-shell-env) took 2s
❯ nix flake show --all-systems
git+file:///Users/olafur/dev/multivac61/blueprint-treefmt-nix?ref=refs/heads/formatter-nix&rev=941b74b0b226640341a8e268e04104bda1def5d2
├───__functor: unknown
├───checks
│   ├───aarch64-darwin
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   ├───aarch64-linux
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   ├───x86_64-darwin
│   │   ├───devshell-default: derivation 'nix-shell'
│   │   └───pkgs-formatter: derivation 'treefmt'
│   └───x86_64-linux
│       ├───devshell-default: derivation 'nix-shell'
│       └───pkgs-formatter: derivation 'treefmt'
├───darwinConfigurations: unknown
├───darwinModules: unknown
├───devShells
│   ├───aarch64-darwin
│   │   └───default: development environment 'nix-shell'
│   ├───aarch64-linux
│   │   └───default: development environment 'nix-shell'
│   ├───x86_64-darwin
│   │   └───default: development environment 'nix-shell'
│   └───x86_64-linux
│       └───default: development environment 'nix-shell'
├───formatter
│   ├───aarch64-darwin: package 'treefmt'
│   ├───aarch64-linux: package 'treefmt'
│   ├───x86_64-darwin: package 'treefmt'
│   └───x86_64-linux: package 'treefmt'
├───homeModules: unknown
├───lib: unknown
├───modules: unknown
├───packages
│   ├───aarch64-darwin
│   │   └───formatter: package 'treefmt'
│   ├───aarch64-linux
│   │   └───formatter: package 'treefmt'
│   ├───x86_64-darwin
│   │   └───formatter: package 'treefmt'
│   └───x86_64-linux
│       └───formatter: package 'treefmt'
├───systemConfigs: unknown
└───templates
```
