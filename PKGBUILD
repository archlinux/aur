# Maintainer: nil
pkgname=ttf-paragon
pkgver=1.0
pkgrel=1
pkgdesc="Sans-serif font"
arch=('any')
license=('unknown')
url='https://www.dafont.com/paragon.font'
source=('paragon.zip::https://dl.dafont.com/dl/?f=paragon')
md5sums=('957fc12c1579d8bd4eaa6c6e32684fc3')

package() {
	cd "${srcdir}"
	install -dm 755      "${pkgdir}/usr/share/fonts/TTF"
	install -m 644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}
