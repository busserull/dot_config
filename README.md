# Common packages

For a typical installation, you usually get these during `pacstrap`:

```text
base base-devel linux linux-firmware man-db man-pages zsh grub tree
efibootmgr git htop bat ripgrep hexyl helix networkmanager intel-ucode
linux-headers
```

For a full system setup, these typically also come along for the ride:

```text
rustup elixir alacritty firefox gdb postgresql inotify-tools prettier slurp
grim fzf playerctl llvm lld ttf-sourcecodepro-nerd clang openocd texmaker
arm-none-eabi-{gcc,gdb,newlib,binutils} mesa opengl-man-pages octave gnome
blender kicad hyprland wofi inkscape font-manager texlive-most nvidia lldb
python rust-analyzer vscode-{css,html,json}-languageserver marksman texlab
python-lsp-black python-lsp-server tailwindcss-language-server swaybg
waybar strace neofetch libreoffice-fresh libreoffice-fresh-nb kicad-library
transmission-gtk nvidia-dkms nvidia-utils lib32-nvidia-utils swaylock
kicad-library-3d vlc libva-nvidia-driver libva-vdpau-driver gcc-fortran
```

## Notes

For `gnome`, the choice is mostly `xdg-desktop-portal-wlr`.
The `gcc-fortran` package is needed to compile and install the `control`
package to `octave`.

## AUR

From the AUR, you want:

1. rebar3
2. elixir-ls
3. davinci-resolve

# DaVinci Resolve

DaVinci Resolve uses certain older libraries without explicitly linking to them.
Additionally, its default desktop entry is case sensitive when searching for it.

Change the `/usr/share/applications/DaVinciResolve.desktop` file as such:

- `GenericName=davinci resolve`
- `Exec=sh -c 'LD_PRELOAD="/usr/lib/libgio-2.0.so /usr/lib/libgmodule-2.0.so /usr/lib/libglib-2.0.so" /opt/resolve/bin/resolve %u'`

# Cursors

- git clone Capitaine Cursors (Gruvbox) into ~/.local/share/icons/capgruv, or check AUR
- Change the name field in ~/.local/share/icons/capgruv/index.theme to "capgruv"
- Symlink from ~/.local/share/icons/capgruv to ~/.local/share/icons/default
- Use the name "capgruv" in all configs
- run `gsettings set org.gnome.desktop.interface cursor-theme 'capgruv'`
