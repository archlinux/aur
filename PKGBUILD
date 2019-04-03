# Maintainer: fenuks

_pkgname=hotswapagent
pkgname=java-${_pkgname}
pkgver=1.3.1
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

sha256sums=('81bd6b2f342002fb9d470e014efe66eb97ebb1dc529a34e591f5173378889674')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
