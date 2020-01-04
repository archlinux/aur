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
sha512sums=('8c6058f3e7186dd622fb44139ea9a7b6ab9da4c4eb5ccf8eee10ccc2c388512c0ff21fc622d59d880c088ee80d9c5fd742f625f1747c9c77115dd39aecf363bb')

package() {
  cd "${srcdir}/pass-clip-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
