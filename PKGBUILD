pkgname=oil
pkgver=0.3.2
pkgrel=1
pkgdesc='Search-as-you-type cli frontend for the buku bookmarks manager using peco. '
arch=('any')
url='https://github.com/AndreiUlmeyda/oil'
license=('GPL3')
depends=('buku' 'peco' 'jq' 'xsel')
source=("https://github.com/AndreiUlmeyda/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('065f4bdcff8ef6642cb1b5fe9c8e95844be26e9a4935859672528b0f76d08adb')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
