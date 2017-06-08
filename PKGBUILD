pkgname=plymouth-theme-arch8
pkgver=0.1
pkgrel=1
pkgdesc='Windows 8 like plymouth theme with Arch logo.'
arch=('i686' 'x86_64' 'armv7h' 'all')
license=(LGPL)
source=('git+https://github.com/Oficerx/plymouth-theme-arch8')
md5sums=('SKIP')
depends=(git plymouth)


prepare() {
	true
}

build() {
	rm "${srcdir}/plymouth-theme-arch8/README.md"
	rm "${srcdir}/plymouth-theme-arch8/.git" -rf
}

package() {
	mkdir -p "${pkgdir}/usr/share/plymouth/themes/"
	cp -r "${srcdir}/plymouth-theme-arch8" "${pkgdir}/usr/share/plymouth/themes/arch8"
}
