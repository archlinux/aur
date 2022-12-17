# Maintainer:Integral<luckys68@126.com>
pkgname=xopcodecalc-bin
_pkgname=xopcodecalc
pkgver=0.05
pkgrel=1
pkgdesc="x86/x64 Assembly Opcode calculator."
arch=('x86_64')
url="https://github.com/horsicq/XOpcodeCalc"
license=('custom')
depends=('qt5-base')
source=("https://github.com/horsicq/XOpcodeCalc/releases/download/0.05/${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst")
sha512sums=('5682eb3fc7832aa481bf4649d5f5235e3633fe3bbb5715733d84aefccf4f1c2ca6ade38e3551c640a9c85f8d5cc6a2c59e906f9da82c4824e918bd5c3c6a6dfc')

package() {
	rm -rf "${pkgdir}/"
	cp -r "${srcdir}/" "${pkgdir}/"
	cd "${pkgdir}/" && rm -f .BUILDINFO .MTREE .PKGINFO "${_pkgname}-${pkgver}-1-x86_64.pkg.tar.zst"
	mv "${pkgdir}/usr/share/licenses/${_pkgname}" "${pkgdir}/usr/share/licenses/${pkgname}"
}
