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
sha512sums=('fffb046136d4b4913ecf0c98811bdc7d60e2cdefd047fd65119c5dfe3432db1b')

package() {
  cd "${srcdir}/pass-clip-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
