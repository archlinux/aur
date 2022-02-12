# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

pkgbase=font-awesome-5
pkgname=(ttf-font-awesome-5 otf-font-awesome-5)
pkgver=5.15.4
pkgrel=1
pkgdesc='Iconic font designed for Bootstrap (version 5.x)'
url='https://fontawesome.com/'
license=('custom:OFL')
arch=('any')
source=("https://github.com/FortAwesome/Font-Awesome/archive/$pkgver.tar.gz")
sha256sums=('82c301594a566277ba3cf41e037fc03ae101727d3e5d682d09e322a53937b5ed')

package_ttf-font-awesome-5() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  rename "fa" "fa5" ./webfonts/*.ttf
  install -m644 ./webfonts/*.ttf "${pkgdir}/usr/share/fonts/TTF"
}

package_otf-font-awesome-5() {
  cd "Font-Awesome-${pkgver}"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -d "${pkgdir}/usr/share/fonts/OTF"
  install -m644 ./otfs/*.otf "${pkgdir}/usr/share/fonts/OTF"
}
