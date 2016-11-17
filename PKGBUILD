# Maintainer: Daniel YC Lin <dlin.tw at gmail.com>
pkgname=gauge-test-tool
_pkgname=gauge
pkgver=0.6.2
pkgrel=1
pkgdesc="light weight cross-platform test automation tool"
arch=(x86_64)
url="https://github.com/getgauge/gauge"
license=('GPL3')
groups=()
depends=()
makedepends=('git' go)
provides=(gauge)
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/getgauge/gauge/releases/download/v$pkgver/gauge-$pkgver-linux.x86_64.zip")
noextract=()
md5sums=('ecd7accc72da48694312a184e9d2efc4')

#build() {
#  mkdir -p $pkgdir/usr/local
#  ./install.sh $pkgdir/usr/local
#}
package() {
  ./install.sh $pkgdir/usr
}

# vim:set ts=2 sw=2 et:
