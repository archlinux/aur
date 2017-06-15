pkgname=oil
pkgver=0.3.0
pkgrel=1
pkgdesc='Search-as-you-type cli frontend for the buku bookmarks manager using peco. '
arch=('any')
url='https://github.com/AndreiUlmeyda/oil'
license=('GPL3')
depends=('buku' 'peco' 'jq' 'xsel')
source=("https://github.com/AndreiUlmeyda/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bf2af1c559f95f1b4e7907b5e20c6b57051e42178038b2d683cb76c858c36809')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
