# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.2
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
sha256sums=('bae38fa9f617ae067d24c8bd9935bb317d8b61ff7d2f29e7effb35b6b5b0a178')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/coursier"
}
