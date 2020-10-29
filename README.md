# nix-norminette

## Guides

### Run

By default the norminette use the Paris configuration.

```console
$ nix run "github:lightdiscord/nix-norminette"
```

But if you are a 42 Lyon student you may want to use the Lyon configuration instead.

```console
$ nix run "github:lightdiscord/nix-norminette#norminette-lyon"
```

### Install

To install the norminette package to your profile you can do the following command.

```console
$ nix profile install "github:lightdiscord/nix-norminette"
```
