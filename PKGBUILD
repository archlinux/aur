# Maintainer: nemu626 <nemu626.log@gmail.com>
pkgname=ttf-hackline-nerd
pkgver=1.1.0
pkgrel=1
pkgdesc="A programming font that combines Hack and LINE Seed Font, with support for Japanese and Korean (including Nerd Fonts)."
arch=('any')
url="https://github.com/nemu626/hackline"
license=('OFL')
depends=('fontconfig')
makedepends=('unzip')
provides=('hackline' 'ttf-hackline')
conflicts=('hackline' 'ttf-hackline' 'ttf-hackline-nerd-git')
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/HackLine-All-v${pkgver}.zip")
sha256sums=('92fd84e68df975cc35ffda6e1505cf87aba65cfee1c0e21e8a218f27bf56cf75')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
}
