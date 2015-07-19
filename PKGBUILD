# Maintainer: Victor Häggqvist <aur@snilius.com>

_pkgname=lightdm-webkit-archsingle-theme
pkgname=$_pkgname-git
pkgver=0.1.0
pkgrel=2
pkgdesc="Archlinux signeluser theme for LightDM Webkit"
arch=('i686' 'x86_64')
url="https://github.com/victorhaggqvist/lightdm-webkit-archsingle-theme"
license=("GPL2")
depends=('lightdm-webkit2-greeter')
makedepends=('git')
providers=("$_pkgname")
conflicts=("$_pkgname")
source=("git://github.com/victorhaggqvist/lightdm-webkit-archsingle-theme")
md5sums=('SKIP')

package() {
    install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/"
    cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/lightdm-webkit/themes/archsingle"
}
