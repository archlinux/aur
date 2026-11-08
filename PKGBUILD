# Maintainer: fenuks

_pkgname=hotswapagent
pkgname=java-${_pkgname}
pkgver=2.0.4
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

sha256sums=('7ed7646da48ee408732a1c3625712a40d1e8381a9a75545caacbd06cbb5bdc95')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
