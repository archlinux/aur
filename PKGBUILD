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
    'ttf-gabarito-git'
    'ttf-jetbrains-mono-nerd'
    'gowall'
    'adw-gtk-theme-git'
    'matugen-bin'
    'darkly-bin'
    'ttf-material-symbols-variable-git'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Theming and appearance for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
