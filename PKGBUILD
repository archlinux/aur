# Maintainer: Amiel Kyamko <junkfactory@gmail.com>
_pkgname=ddterm
pkgname=gnome-shell-extension-$_pkgname
pkgver=v20
pkgrel=1
pkgdesc="Another Drop Down Terminal Extension for GNOME Shell"
arch=('any')
url="https://github.com/amezin/$pkgname"
license=('GPL3')
depends=('gnome-shell')
install=$_pkgname.install
source=($pkgname.zip::https://github.com/amezin/gnome-shell-extension-ddterm/releases/download/$pkgver/ddterm@amezin.github.com.shell-extension.zip)
sha256sums=('a1ad9365c97b19b7d17a843de128aeb07c89917bcf962429a0a64023e79316e4')

package() {
    gnome-extensions install -f $pkgname.zip
}

