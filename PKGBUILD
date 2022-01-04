# Maintainer: Amiel Kyamko <junkfactory@gmail.com>
_uuid=ddterm@amezin.github.com
_pkgname=ddterm
pkgname=gnome-shell-extension-$_pkgname
pkgver=25
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell"
arch=('any')
url="https://github.com/amezin/$pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
makedepends=('zip')
source=($pkgname-v$pkgver.zip::https://github.com/amezin/gnome-shell-extension-ddterm/releases/download/v$pkgver/ddterm@amezin.github.com.shell-extension.zip)
sha256sums=('c49579c7e91618215eb7e773fd58a1a05b4d3470429720d27fc72e3843529005')

package() {
    local dest="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
    install -d "${dest}"
    bsdtar --no-same-owner -xvf $pkgname-v$pkgver.zip -C "${dest}"
}
