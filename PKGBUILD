# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=theos-ios-toolchain
pkgver=2017.03.08
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="CoolStar's theos toolchain for iOS"
arch=('any')
url="https://github.com/theos/theos/wiki/Installation"
license=('custom')
depends=('theos')
makedepends=()
optdepends=()
source=("https://developer.angelxwind.net/Linux/ios-toolchain_clang%2bllvm%2bld64_${_pkgver}_linux_x86_64.zip")
sha256sums=('973e29443b62d867dc40a289ae5cdebe5fc30a1f718f0ef60cbf16fcdd412d07')

package() {
	mkdir -p "${pkgdir}/opt/theos/toolchain"
	cp -dpr --no-preserve=ownership "${srcdir}/linux" "${pkgdir}/opt/theos/toolchain"
}
