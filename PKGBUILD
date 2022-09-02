# Maintainer: xeruf <27jf at pm dot me>

_pkgname='plantuml-elk'
pkgname="${_pkgname}"
pkgver=0
pkgrel=1
pkgdesc='Eclipse Layout Kernel for PlantUML - also see https://github.com/eclipse/elk'
arch=('any')
url="https://plantuml.com/elk"
license=(ELP)
depends=()
provides=()
conflicts=()
optdepends=(plantuml)
source=("http://beta.plantuml.net/elk-full.jar")
sha512sums=('f5eb64149e6e741fd3158db61a4f84e6d561b14701e26701a292e4383db0a8ef3738fbbde745f82664a3ec258be03a831626020ac4b1144eb0014629d85e034d')

package() {
  install -D --target-directory "${pkgdir}/usr/share/java/plantuml" elk-full.jar
}
