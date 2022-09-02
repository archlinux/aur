# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=2.2.1
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
provides=('ttf-font-nerd'
          'ttf-font')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LiberationMono.zip")
sha256sums=('f53545d935ae2d4124bc1f88a67576457defb90f70829b8f8b6a77fa9e3cdd6b')

package() {
  cd "${srcdir}"
  install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" ./*.ttf
  install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
