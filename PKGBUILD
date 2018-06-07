# Maintainer: Anders Skaalsveen <anders[at]bakkenbaeck[dot]no>
pkgname=adb-screen-tools
pkgver=0.4
pkgrel=4
pkgbase=
pkgdesc="Extra screen-utilities for android-devices"
arch=('any')
url="https://github.com/bakkenbaeck/adb-screen-tools"
license=('MIT')
groups=()
provides=('adb-screen-tools')
conflicts=('adb-screen-tools')
depends=()
makedepends=('git')
source=("$pkgname::git+https://github.com/bakkenbaeck/adb-screen-tools.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  true
}

package() {
  cd "$pkgname"
  install -D -m 755 adb-record-gif.sh "$pkgdir/usr/bin/adb-record-gif"
  install -D -m 755 adb-screen-capture.sh "$pkgdir/usr/bin/adb-screen-capture"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/adb-screen-tools/LICENSE"
}
