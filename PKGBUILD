# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.0.0

pkgname=coursier
pkgver="$_version"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-environment' 'bash')

source=("https://github.com/coursier/coursier/raw/v$pkgver/coursier")
sha256sums=('32cf24bbd4221f1d36129e326baeff908eb84ee99dd686ae19a3e339ee63c704')
noextract=('coursier')

package() {
  install -D -m755 "coursier" "${pkgdir}/usr/bin/coursier"
}
