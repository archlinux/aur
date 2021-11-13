# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=mega
_pkgname=mega
pkgver=11.0.10
pkgrel=1
pkgdesc=" Molecular Evolutionary Genetics Analysis"
arch=('x86_64')
url="https://megasoftware.net"
license=('custom')
depends=(
	'desktop-file-utils'
	'gconf'
	'gtk2>=2.0'
	'hicolor-icon-theme'
	'metasploit>=2.0'
)
source=(""https://www.megasoftware.net/releases/mega_$pkgver-1_amd64.deb)
sha256sums=('a792e6182579b360369e936248d583a92fa79e6c2cd17820111ec6fca3f8066f')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	cp -r ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local 
}
