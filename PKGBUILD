# Maintainer: dszryan <9117127+dszryan@users.noreply.github.com>
pkgver=0.3
pkgname=wayland-mouse-mapper-git
pkgrel=1
pkgdesc="Maps mouse buttons to keys in wayland, configured to swap workspaces under gnome"
url="https://github.com/dszryan/$pkgname"
arch=('any')
license=('GPL')
makedepends=('git')
depends=('libinput>=1.14.1' 'evemu>=2.7.0')
source=("${pkgname}-${pkgver}::git+https://github.com/dszryan/$pkgname.git")
md5sums=('SKIP')
install="${pkgname}.install"

package() {

  install -D -t "$pkgdir/usr/bin"                "$srcdir/$pkgname-$pkgver/mousemapper"
  install -D -t "$pkgdir/usr/lib/systemd/system" "$srcdir/$pkgname-$pkgver/mousemapper.service"

}