# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.0-RC6-27
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching (native-image edition)"
arch=("x86_64")
url="http://get-coursier.io"
license=("Apache")
depends=("gcc-libs" "zlib")
provides=("coursier")
conflicts=("coursier")
source=("coursier-$pkgver::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux")
sha256sums=('9ddf21d959288649ecd16b6259c5016cafb7cd9585a8fe6fb8e6d6b4bb68eab6')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/coursier"
}
