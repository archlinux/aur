# Maintainer: Grigorii Horos <horosgrisa@gmail.com>
pkgname=papirus-icon-theme
pkgver=2015.07.29
pkgrel=1
pkgdesc=" Modified and adaptive Paper icon theme for KDE"
url="https://github.com/varlesh/papirus-icon-theme"
arch=('any')
license=('CC-BY-SA')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("git://github.com/varlesh/papirus-icon-theme")
sha256sums=('SKIP')


package() {
    install -dm755 "${pkgdir}/usr/share/icons"
    cp -R papirus-icon-theme/papirus-black-panel $pkgdir/usr/share/icons
    cp -R papirus-icon-theme/papirus-dark        $pkgdir/usr/share/icons
    cp -R papirus-icon-theme/papirus             $pkgdir/usr/share/icons
    install -D -m644 papirus-icon-theme/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}

# vim:set ts=2 sw=2 et: