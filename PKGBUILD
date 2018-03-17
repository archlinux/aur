# Maintainer: fenuks

_pkgname=hotswapagent
pkgname=java-${_pkgname}
pkgver=1.2.1
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
source=("${pkgname}-${pkgver}.jar::https://github.com/HotswapProjects/HotswapAgent/releases/download/${pkgver}-SNAPSHOT/hotswap-agent-${pkgver}-SNAPSHOT.jar")

sha256sums=('db6b2227d8ded21bb6faa756d256cbde8da719f3908cf1cedd99ce4b418c49b9')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
