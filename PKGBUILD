# Maintainer: Alfredo Ramos <alfredo dot ramos at yandex dot com>

_themename=urbanlifestyle
pkgname=sddm-${_themename}-theme
pkgver=0.1.7
pkgrel=1
pkgdesc='A simple and colorful SDDM theme.'
arch=('any')
url='https://github.com/AlfredoRamos/sddm-urbanlifestyle-theme'
license=('GPL3')

depends=('sddm')
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")

install=${pkgname}.install

source=(
	"${_themename}-${pkgver}.tar.gz::https://github.com/AlfredoRamos/${pkgname}/archive/${pkgver}.tar.gz"
	"${pkgname}.install"
)
sha512sums=(
	'c571c8c7a62e92d969ea7fe93ceef22e35a88c7b279b77548a1978526dffdbfe3453cf53c44de4f0894eb61e5ccdfa62bffa80fe98e9e3a5c943ace231246b15'
	'82e45735be3ff5fe1a87b0df7be702bc4e9b887a3239490d5b7a41587792cd32f05cdac616b93ab18170b9c3c1ed06f85d07328f7ddf2ef818dab80f4374c8a2'
)

package() {
	msg2 "Installing theme..."
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p ${pkgdir}/usr/share/sddm/themes
	cp -R ./${_themename} ${pkgdir}/usr/share/sddm/themes
}