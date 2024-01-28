# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>
pkgname='fabric-api'
pkgver='0.95.1'
pkgrel=1
pkgdesc='ightweight and modular API providing common hooks and intercompatibility measures utilized by mods using the Fabric toolchain'
arch=('any')
url="https://fabricmc.net/"
license=("MIT")
depends=("fabric-server")

source=("https://www.curseforge.com/minecraft/mc-mods/fabric-api/download/5052823")
sha256sums=("cb9eb29329ca32f7a05e5094a662133ec9abb4ea1a5c333019e10cdefa23b037")
b2sums=("af646028fec23caaf0b70adc3c0932724cbee20cd9cde941f9072bc054be615bb898998382d835b105957a0ecf6dd84d43d197451d4ada1aeb72e3a849c03096")

package() {
    install -Dm644 5052823 "${pkgdir}/srv/fabric/mods/fabric-api-0.95.1+1.20.4.jar"
}

