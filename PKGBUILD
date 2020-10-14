# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='fontpreview'
pkgver=1.0.6
pkgrel=1
pkgdesc='Highly customizable and minimal font previewer written in bash'
arch=('any')
url='https://github.com/sdushantha/fontpreview'
license=('MIT')
depends=('fzf' 'imagemagick' 'sxiv' 'xdotool')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('5785ed96852b84e082c05af56d4811ea8a830ed714d683201a128436a32f7758')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm755 "${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
