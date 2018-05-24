# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.1.0_M4

pkgname=coursier
pkgver="$_version"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-runtime-headless>=8' 'bash')

source=("https://github.com/coursier/coursier/raw/v${pkgver/_/-}/coursier")
sha256sums=('918ba6627f997b5cd051caec5b67306e8f708e22d53042eacd66f65ae32952b5')
noextract=('coursier')

package() {
  install -D -m755 "coursier" "${pkgdir}/usr/bin/coursier"
}
