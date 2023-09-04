# Maintainer: Santiago Lo Coco <mail at slococo dot com dot ar>

pkgname=imgur.sh
pkgver=10.1
pkgrel=2
pkgdesc="Bart's Imgur uploader bash script."
arch=('any')
url="https://github.com/tremby/imgur.sh"
license=('Unlicense')
depends=('curl')
optdepends=('xsel: copy the URL to clipboard (or xclip)'
            'xclip: copy the URL to clipboard (or xsel)')
source=("https://github.com/tremby/imgur.sh/archive/v${pkgver}.tar.gz")
sha256sums=('7cff3c68377ab0783619ee96bde4b73ed9032b1ce8f9164462f6e6718f69f814')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 imgur.sh "${pkgdir}/usr/bin/imgur.sh"
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
