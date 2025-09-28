# Maintainer: ElmF <elmforestw@proton.me>

pkgname=noto-fonts-emoji-colrv1
pkgver=2.051
pkgrel=1
epoch=1
pkgdesc='Google Noto Color Emoji font'
arch=(any)
url='https://www.google.com/get/noto/'
license=(OFL-1.1-no-RFN)
provides=(emoji-font noto-fonts-emoji)
makedepends=(git)
source=(git+https://github.com/googlefonts/noto-emoji.git#tag=v$pkgver)
sha256sums=('6c2bd2074fdd9ac239a891ab1917b6fedd53c2e80ffdc9f0cd4d98625ef6b249')

package() {
  cd noto-emoji
  mkdir -p "$pkgdir"/usr/share/fonts/noto
  install -m644 fonts/Noto-COLRv1.ttf "$pkgdir"/usr/share/fonts/noto
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
