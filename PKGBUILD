# Maintainer: onemoresuza <aur at onemoresuza dot mailer dot me>
pkgname='ttf-literation'
pkgver=2.1.0
pkgrel=1
pkgdesc="A ttf Nerd Font based on ttf-liberation"
arch=('any')
url='https://github.com/ryanoasis/nerd-fonts'
license=('custom:SIL Open Font License Version 1.1')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/LiberationMono.zip"
        "LICENSE::${url}/raw/master/patched-fonts/LiberationMono/complete/LICENSE")
sha256sums=('30b0e02385c43c92a9556689eda6c83731525c431f6eba9dad556b3512aa77a5'
            '93fed46019c38bbe566b479d22148e2e8a1e85ada614accb0211c37b2c61c19b')

package() {
	cd "${srcdir}"
  install -Dm 0644 -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
  install -Dm 0644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
