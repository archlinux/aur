# Contributor: Guillaume Bodi <bodi.giyomu at gmail.com>

pkgname=xerox-docucentre-driver
pkgver=1.0.1
_pkgver=1.1.2-1
pkgrel=2
pkgdesc="Driver for the Fuji-Xerox DocuCentre series. Also supports ApeosPort and DocuPrint series."
url="https://www.fujixerox.co.jp/download/docuprint/download/p450d/linux64/"
license=('custom')
arch=('x86_64')
depends=(cups)
source=(http://download.fujixerox.co.jp/pub/exe/docuprint/p450d/fxlinuxprint-${_pkgver}.x86_64.rpm)
md5sums=('79ec7134ec48d839b916b654331d53ca')

package() {
	cd "${srcdir}"

  rm -rf "${srcdir}"/usr/lib64
	cp -R "${srcdir}"/usr "${pkgdir}"
}


