# Maintainer: William Tang <galaxyking0419@gmail.com>
# Co-Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>

pkgname=adlmapps
pkgver=31.0.4
pkgrel=1
pkgdesc='Autodesk Licensing Software'
arch=('x86_64')
url='https://www.autodesk.com/'
license=('custom')
depends=('qt5-svg')

DLAGENTS+=('manual::/usr/bin/echo \ \ Note: Please download the package manually from the official website')
source=("manual://adlmapps${pkgver%%.*}-$pkgver-0.x86_64.rpm")
b2sums=('945cba6d68d7de0a1d362f0b68190335145a86fb229f2f81be356d78b4f01dc6a077afcc46922ba710c338e9ca460786f05a8b6853323a9d2d0d992542ad482e')

options=(!strip)
install="${pkgname}.install"

package() {
	mv opt var "$pkgdir/"
}
