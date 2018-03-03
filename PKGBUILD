# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.0.2

pkgname=coursier
pkgver="$_version"
pkgrel=2
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-environment' 'bash')

source=("https://github.com/coursier/coursier/raw/v1.0.1/coursier")
sha256sums=('23aa05a84a9df5d84b76be40659300bfcb367d8a1b4307908f89ba3fc6dac1e6')
noextract=('coursier')

package() {
  install -D -m755 "coursier" "${pkgdir}/usr/bin/coursier"
}
