pkgname=batman-adv-legacy-dkms
pkgver=20161206
pkgrel=1
pkgdesc='batman kernel module (legacy version based on compat 14, dkms package)'
arch=('any')
url='https://github.com/freifunk-gluon/batman-adv-legacy/'
license=('GPL')
source=(
	'batman-adv-legacy::git+https://github.com/freifunk-gluon/batman-adv-legacy.git#commit=ccee1a4b97aa72e980b8a5e5c9733562a5f6c5b1'
)
sha256sums=('SKIP')
depends=('dkms')

package() {
	install -dm755 "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"

	cp -r "${srcdir}"/batman-adv-legacy/* "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}
