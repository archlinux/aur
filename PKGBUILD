# Maintainer: Bailey Kasin <bailey@gingertechnology.net>

pkgname=sddm-theme-amadeus
pkgver=1.0
pkgrel=1
pkgdesc="Amadeus theme for SDDM"
arch=('any')
url="https://github.com/Michal-Szczepaniak/sddm-theme-amadeus"
license=('DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE')
depends=(
	'sddm'
	'otf-takao'
)
install="$pkgname.install"
source=("https://github.com/BaileyGingerTechnology/sddm-theme-amadeus/archive/${pkgver}-nvk.tar.gz")
md5sums=('4f9174a1369faa458583e6f4119c8aba')

package() {
  install -d "${pkgdir}"/usr/share/sddm/themes/amadeus
  install -d "${pkgdir}"/usr/share/sddm/themes/amadeus/{fonts,components}
  install -Dm644 ${pkgname}-${pkgver}-nvk/{COPYING,IPA_Font_License_Agreement_v1.0.txt,Main.qml,README.md,amadeus-background.png,metadata.desktop} \
    "${pkgdir}"/usr/share/sddm/themes/amadeus
  install -Dm644 ${pkgname}-${pkgver}-nvk/components/SpTextBox.qml "${pkgdir}"/usr/share/sddm/themes/amadeus/components
  install -Dm644 ${pkgname}-${pkgver}-nvk/fonts/TakaoMincho.ttf "${pkgdir}"/usr/share/sddm/themes/amadeus/fonts
}

