# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>
pkgname=afraid-dyndns-uv
pkgver=1
pkgrel=3
pkgdesc="FreeDNS.afraid.org dynamic DNS client written in perl, modified by ultraviolet."
arch=('any')
url="http://goo.gl/ybNjv"
license=('GPL3')
groups=()
depends=('perl' 'perl-libwww' 'perl-xml-simple')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(afraid-dyndns-uv)
noextract=()
md5sums=('d75d2639ea500e78d232e4824476eabb')

build() {
  cd "$srcdir"
  chmod +x afraid-dyndns-uv
}

package() {
  cd "$srcdir"
  mkdir $pkgdir/usr
  mkdir $pkgdir/usr/bin
  cp ./afraid-dyndns-uv $pkgdir/usr/bin/afraid-dyndns-uv
}
