# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=2.2.0_RC
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
provides=('ttf-font-nerd'
          'ttf-font')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver/_/-}/LiberationMono.zip")
sha256sums=('8f39cefa2db297d8e0a203fa25a7744a5c618481b0ad220e9f96aea553a7bd52')

package() {
  cd "${srcdir}"
  install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
  install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
