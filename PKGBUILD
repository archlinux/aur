# Maintainer: Felipe Contreras <felipe.contreras@gmail.com>

pkgname=xfce-config-helper
pkgver=1.0
pkgrel=1
pkgdesc='Tools to help manage Xfce configurations'
depends=('ruby' 'ruby-dbus')
url="https://github.com/felipec/$pkgname"
arch=('any')
license=('MIT')
makedepends=('git')
source=("$pkgname::git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd $pkgname &&
  DESTDIR="$pkgdir" make prefix=/usr install
}
