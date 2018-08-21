# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.1.0_M7

pkgname=coursier
pkgver="$_version"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-runtime-headless>=8' 'bash')

source=("https://github.com/coursier/coursier/raw/v${pkgver/_/-}/coursier")
sha256sums=('7ffb17aff47f17f663c35250d880c2d5db908ceae99dae05eb57bb6426f44539')
noextract=('coursier')

package() {
  install -D -m755 "coursier" "${pkgdir}/usr/bin/coursier"
}
