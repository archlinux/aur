# Maintainer: fenuks

_pkgname=hotswapagent
pkgname=java-${_pkgname}
pkgver=2.0.3
pkgrel=1
pkgdesc="Java unlimited redefinition of classes at runtime."
arch=("any")
url="https://github.com/HotswapProjects/HotswapAgent"
license=("GPL2")
depends=("java-runtime")
optdepends=()
makedepends=()
provides=("${pkgname}")
conflicts=("${pkgname}")
# install=$pkgname.install
source=("${pkgname}-${pkgver}.jar::https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-${pkgver}/hotswap-agent-${pkgver}.jar")

sha256sums=('4ef49724b7d8523536d2e2a7310f827f4db9f4fed3489224e05d7bf87f0594f9')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
