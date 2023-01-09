# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=2.2.2
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
provides=('ttf-font-nerd'
          'ttf-font')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LiberationMono.zip")
sha256sums=('16a492fbc24aeb5e201fa7d21478c8b7629f96b49827fb5369e8b0d8a75c022b')

package() {
  cd "${srcdir}"
  install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ./*.ttf
  install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
