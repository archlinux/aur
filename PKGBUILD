# Maintainer: ZeroDegress <zerodegress@outlook.com>

pkgname=clfs-for-loongarch-cross-tools-gcc-bin
pkgver=8.1
pkgrel=2
pkgdesc='Cross compiler for Loongarch64 from clfs'
arch=('x86_64')
url='https://github.com/sunhaiyong1978/CLFS-for-LoongArch'
license=('custom')
depends=()
source=("https://github.com/sunhaiyong1978/CLFS-for-LoongArch/releases/download/${pkgver}/CLFS-loongarch64-${pkgver}-x86_64-cross-tools-gcc.tar.xz")
sha256sums=('83992fe12ef6dddce8b45759601341a810c4911d68483ffac330a74729846aa4')

options=(!strip)

package() {
    mkdir -p "${pkgdir}/opt/clfs-for-loongarch/cross-tools"
	cp -dpr --no-preserve=ownership "${srcdir}"/cross-tools/* "${pkgdir}/opt/clfs-for-loongarch/cross-tools"
}
