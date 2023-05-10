# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=3.0.0
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
provides=('ttf-font-nerd'
	'ttf-font')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LiberationMono.zip")
sha256sums=('f66aa180b000671b5d0f6498b4065424115d4635538b03b03b083ded819350bd')

package() {
	cd "${srcdir}"
	install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ./*.ttf
	install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
