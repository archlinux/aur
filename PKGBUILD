# Former Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>
# Maintainer: Justin Williams <justin@justinandyadi.com>

pkgname=theos-ios-toolchain
pkgver=2019.10.15
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="Kabir's theos toolchain for iOS"
arch=('any')
url="https://github.com/theos/theos/wiki/Installation"
license=('custom')
depends=('theos')
makedepends=()
optdepends=()
source=("toolchain.tar.gz::https://kabiroberai.com/toolchain/download.php?toolchain=ios-linux")
sha256sums=('d21ea9bef671af204932f4f99095f4906a7c7639dedc04eec72ed317fcd96284')

package() {
	mkdir -p "${pkgdir}/opt/theos/toolchain"
	cp -dpr --no-preserve=ownership "${srcdir}/linux" "${pkgdir}/opt/theos/toolchain"
}
