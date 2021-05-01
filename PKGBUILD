# Contributor: Guillaume Bodi <bodi.giyomu at gmail.com>

pkgname=xerox-docucentre-driver
pkgver=1.1.3_4
_pkgver=1.1.3-4
pkgrel=1
pkgdesc="Driver for the Fuji-Xerox DocuCentre series. Also supports ApeosPort and DocuPrint series."
url="https://www.fujixerox.co.jp/download/docuprint/download/p450d/linux64/"
license=('custom')
arch=('x86_64')
depends=(cups)
source=(https://www.fujifilm.com/fb/sync/pub/exe/docuprint/p450d/fflinuxprint-${_pkgver}.x86_64.rpm)
md5sums=('d99ad4e443366519b7b729086a26b152')

package() {
	cd "${srcdir}"

  rm -rf "${srcdir}"/usr/lib64
	cp -R "${srcdir}"/usr "${pkgdir}"
}


