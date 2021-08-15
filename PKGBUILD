# Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>

pkgname='pass-clip'
pkgver=0.3
pkgrel=1
pkgdesc='A pass extension that lets you quickly copy to clipboard passwords using fzf or rofi.'
arch=('any')
url='https://github.com/ibizaman/pass-clip'
license=('GPL3')
depends=('pass')
optdepends=('rofi: Use rofi to present choices.'
            'fzf: Use fzf to present choices.')
source=(https://github.com/ibizaman/pass-clip/archive/v${pkgver}.tar.gz)
sha512sums=('216298a8b1419b88d08c17d0a7f9caae7939391a3336a423c9bf965eb04e0742968c043272d31bc72a3c21097193b746845722c8bdf3203d3cee19267b07b94d')

package() {
  cd "${srcdir}/pass-clip-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install
}
