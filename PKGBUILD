# Maintainer: Amiel Kyamko <junkfactory@gmail.com>
_uuid=ddterm@amezin.github.com
_pkgname=ddterm
pkgname=gnome-shell-extension-$_pkgname
pkgver=21
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell"
arch=('any')
url="https://github.com/amezin/$pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
makedepends=('zip')
source=($pkgname-v$pkgver.zip::https://github.com/amezin/gnome-shell-extension-ddterm/releases/download/v$pkgver/ddterm@amezin.github.com.shell-extension.zip)
sha256sums=('c77cc704f043db9db096b9d7da49a30dc6462badee074b7242d415aef60be03b')

package() {
    local dest="${pkgdir}/usr/share/gnome-shell/extensions/$_uuid"
    install -d "${dest}"
    bsdtar --no-same-owner -xvf $pkgname-v$pkgver.zip -C "${dest}"
}
