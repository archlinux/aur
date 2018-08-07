# Maintainer: Tim Schumacher <timschumi@gmx.de>

pkgname=arm-eabi-4.7
pkgver=4.4.4_r2
pkgrel=1
pkgdesc="Google's arm-eabi-4.7 toolchain for Android"
arch=("x86_64")
url="https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7"
license=('unknown')
groups=()
depends=()
makedepends=()
options=(!strip libtool staticlibs)
source=("git+https://android.googlesource.com/platform/prebuilts/gcc/linux-x86/arm/arm-eabi-4.7#tag=android-${pkgver}")
md5sums=('SKIP')

package() {
	install -d -m0755 "${pkgdir}/opt/toolchains"
	cp -a "${srcdir}/arm-eabi-4.7" "${pkgdir}/opt/toolchains/"
	rm -r "${pkgdir}/opt/toolchains/arm-eabi-4.7/.git"
}
