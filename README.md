# Visual Studio Code Insiders Arch
![Update](https://github.com/nihaals/visual-studio-code-insiders-arch/workflows/Update/badge.svg)

This is an autoupdating Visual Studio Code Insiders package for Arch. `PKGBUILD` and `.SRCINFO` are automatically updated and pushed. If you would like to build the package yourself, you can simply clone this repo and `makepkg -si` (pulling beforehand if you want to update). If checksums fail it is because the version in your `PKGBUILD` is not the same as the current latest version. If you would like pre-built packages, check [GitHub Actions](https://github.com/nihaals/visual-studio-code-insiders-arch/actions?query=workflow%3AUpdate) which includes a package in the artefacts. There is also a repository available hosted on GitHub Actions, which is also automatically updated (see [installation](#installation)). The `PKGBUILD` is based on [visual-studio-code-insiders AUR](https://aur.archlinux.org/cgit/aur.git/tree/?h=visual-studio-code-insiders&id=4985e7bb2e200eca56b8e237aae19343a38f2b21).

## Installation

Add the following to `/etc/pacman.conf`:
```
[visual-studio-code-insiders]
Server = https://nihaals.github.io/visual-studio-code-insiders-arch/
SigLevel = PackageOptional
```

Install with `$ pacman -Syu visual-studio-code-insiders`
