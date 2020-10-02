# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.0
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
sha256sums=('e2e838b75bc71b16bcb77ce951ad65660c89bda7957c79a0628ec7146d35122f')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/coursier"
}
