# Maintainer: fenuks

_pkgname=hotswapagent
pkgname=java-${_pkgname}
pkgver=1.4.1
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
source=("${pkgname}-${pkgver}.jar::https://github.com/HotswapProjects/HotswapAgent/releases/download/master/hotswap-agent-${pkgver}.jar")

sha256sums=('b95217e6420c4170911e689729c09b28933bf942d1d1292200a46a48c1cb37b0')

package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${_pkgname}/${_pkgname}.jar"
}
