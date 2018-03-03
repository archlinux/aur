# Maintainer: Martynas Mickevičius <self at 2m dot lt>
_version=1.0.2

pkgname=coursier
pkgver="$_version"
pkgrel=1
pkgdesc="Pure Scala Artifact Fetching"
arch=('any')
url="http://get-coursier.io"
license=('Apache')
depends=('java-environment' 'bash')

source=("https://github.com/coursier/coursier/raw/v$pkgver/coursier")
sha256sums=('a92945f132b91c43f117cf1a99beed8e1d2301ee02e57488e53a9d45a0514d7e')
noextract=('coursier')

package() {
  install -D -m755 "coursier" "${pkgdir}/usr/bin/coursier"
}
