# Maintainer: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.0.0-RC6-24
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
sha256sums=('c598326e21b57c1dcaaefa797dbbfe47724922cd7649e86a43c8acab3743aeb0')

package() {
  install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/coursier"
}
