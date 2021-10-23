# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgname=mega
_pkgname=mega
pkgver=11.0.9
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
sha256sums=('6c84c998d5873888a8496f6ac5a5d6f438923e3d6548e226803d1f757928e6b3')

package() {
	tar -p -xf data.tar.xz -C "${pkgdir}"
	chmod 755 -R ../pkg/${pkgname}/usr
	cp -r ../pkg/${pkgname}/usr/local/* ../pkg/${pkgname}/usr/
	rm -r ../pkg/${pkgname}/usr/local 
}
