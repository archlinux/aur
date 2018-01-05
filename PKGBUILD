# Maintainer: Anders Skaalsveen <anders[at]bakkenbaeck[dot]no>
pkgname=adb-screen-tools
pkgver=0.1
pkgrel=1
pkgbase=
pkgdesc="Tool recording gifs on android-devices"
arch=('any')
url="https://github.com/bakkenbaeck/adb-screen-tools"
license=('MIT')
groups=()
provides=('adb-screen-tools')
conflicts=('adb-screen-tools')
depends=(
  'bash'
)
makedepends=('git')
source=("$pkgname::git+https://github.com/bakkenbaeck/adb-screen-tools.git")
md5sums=(SKIP)

build() {
  true
}

package() {
  cd "$pkgname"
  install -D -m 755 adb-record-gif "$pkgdir/usr/bin/adb-record-gif"
}
