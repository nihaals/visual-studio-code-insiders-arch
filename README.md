# Visual Studio Code Insiders Arch
This is based on [visual-studio-code-insiders AUR](https://aur.archlinux.org/cgit/aur.git/tree/?h=visual-studio-code-insiders&id=4985e7bb2e200eca56b8e237aae19343a38f2b21)

## Installation

Add the following to `/etc/pacman.conf`:
```
[visual-studio-code-insiders]
Server = https://nihaals.github.io/visual-studio-code-insiders-arch/
SigLevel = PackageOptional
```

Install with `$ pacman -Syu visual-studio-code-insiders`
