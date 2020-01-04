# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='pass-clip'
pkgver=0.2
pkgrel=1
pkgdesc='A pass extension that lets you quickly copy to clipboard passwords using fzf or rofi.'
arch=('any')
url='https://github.com/ibizaman/pass-clip'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=(https://github.com/ibizaman/pass-clip/archive/v${pkgver}.tar.gz)
sha512sums=('c2c0b3090e3b443e57fd5161d4705be3e676968928fca285d5c0bb21cb64d719e7b409e83fe298408216f348c3d0ea9a5f786f50f009bfe18ca19e75af8a13b6')

package() {
  cd "${srcdir}/pass-clip-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
