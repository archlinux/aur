# Maintainer: Grego Dadone <grego.dadone at gmail dot com>

pkgname=sddm-old-breeze-theme
pkgver=1.0
pkgrel=1
pkgdesc="Plasma 5.7 Breeze SDDM Theme"
arch=('any')
url="https://github.com/sddm/sddm"
license=('CC-BY-SA')
depends=('sddm')
install="$pkgname.install"
source=("https://github.com/gregodadone/sddm-old-breeze-theme/raw/master/breeze-5.7.tar.gz"
		"${pkgname}.install")
md5sums=('4be8292c5b47e8b59105334127afa4a8'
		 'be5b8bb99f930776c91d580cd36f9cfe')

package() {
  mkdir -p "${pkgdir}"/usr/share/sddm/themes
  cp -R breeze-5.7 "${pkgdir}"/usr/share/sddm/themes/breeze-5.7
}
