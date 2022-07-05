# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=kronisk
pkgver=0.1.0
pkgrel=3
pkgdesc='Runs a command quietly unless it fails. Python implementation of chronic(1).'
arch=('any')
url='https://codeberg.org/kas/kronisk'
license=('GPL3')
provides=('kronisk')
conflicts=('kronisk')
depends=('python')
makedepends=('scdoc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
build() {
  cd "$pkgname" || exit 1

  make
}

package() {
  cd "$pkgname" || exit 1

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

sha256sums=(
  '06cdb3da1de3cae30a2c0c5e27db072e6eb1b72f65207bb0d4d2dbd029dcfdb2'
)
sha512sums=(
  'a02327442fbbc44c943f7ac8e0c1bc3ca9b6412ada55ef39982497c381ae1e9b96e4dec6f70586e2e59ec36b8aea68de2cffe30113ffddb1dcdcf34e47121046'
)
b2sums=(
  'a0477f682f57701e589c6e5d2cae2c68e87f12dd700f939a75fa0bc8aefef0a5726842aec08628d933c5da2b3a187d09bded565546fcfce1e2ee3d3a5315557e'
)

# eof
