# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
_pkgname=blush
pkgname=${_pkgname}-bin
pkgver=0.6.0
pkgrel=2
pkgdesc='Grep with colours'
arch=('x86_64')
url='https://github.com/arsham/blush'
license=('MIT')
provides=('blush')
conflicts=('blush')
source=("${pkgname}-${pkgver}::https://github.com/arsham/blush/releases/download/v${pkgver}/blush_linux_v${pkgver}.tar.gz"
				"https://raw.githubusercontent.com/arsham/blush/master/LICENSE")
sha256sums=('47dab7a863a4eff082761e3aaf8a7bef301a3d48a981d41000eda4c98ea55090'
            'e454176c1eee8447eafe4042cdea5359eec6e5c80a4d2b8e0c5f1c3ec86189e6')

package() {
  cd deploy
	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
