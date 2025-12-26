# Maintainer: PharmaRacist
pkgname=noon-looks
pkgver=2.0.0
pkgrel=1
pkgdesc="Theming and appearance packages for Noon"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'adw-gtk-theme'
    'archlinux-xdg-menu'
    'fontconfig'
    'gtk4'
    'kde-material-you-colors'
    'libadwaita'
    'qt6-wayland'
    'ttc-iosevka'
    'ttf-readex-pro'
    'ttf-roboto-flex'
    'ttf-rubik-vf'
)
optdepends=(
    'adw-gtk-theme-git: GTK theme (git version)'
    'darkly-bin: Dark theme support'
    'gowall: Wallpaper manager'
    'matugen-bin: Material You color generator'
    'ttf-gabarito-git: Gabarito font'
    'ttf-jetbrains-mono-nerd: JetBrains Mono Nerd Font'
    'ttf-material-symbols-variable-git: Material Symbols font'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Theming and appearance for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
