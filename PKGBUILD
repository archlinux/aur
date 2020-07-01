# Maintainer: BrLi <brli@chakralinux.org>

_base_name=jf-openhuninn
pkgname=ttf-${_base_name}
pkgver=1.1
pkgrel=1
pkgdesc='An opensource Chinese font by justfont, based on Kosugi Maru and Varela Round'
arch=('any')
url='https://justfont.com/huninn/'
license=('OFL')
source=("https://github.com/justfont/open-huninn-font/releases/download/v${pkgver}/${_base_name}-${pkgver}.zip")
sha256sums=('1b5a8d0204f5763408609d5e8182455d23a2ebc7450730aed19cc13c619bca37')

package() {
  cd "${_base_name}-${pkgver}"
  install -Dm644 "${_base_name}-${pkgver}.ttf" "${pkgdir}/usr/share/fonts/TTF/${_base_name}.ttf"
  install -Dm644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
