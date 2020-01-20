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
sha512sums=('5aa11d97352e15d4a49ae590b01ac2806e74e221739ac27f58f7fe9a81a457c5c02e2cc4e8f2685c3abbdc2ccdca0748047ae8e756e650fc0b65b2bb5b11d5da')

package() {
  cd "${srcdir}/pass-clip-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
