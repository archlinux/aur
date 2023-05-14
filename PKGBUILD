# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=3.0.1
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
provides=('ttf-font-nerd'
	'ttf-font')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LiberationMono.zip")
sha256sums=('3aab38b35fbb25dccb185febe12779fd0ddd8447b3551f45f1088e86221554fe')

package() {
	cd "${srcdir}"
	install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ./*.ttf
	install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
