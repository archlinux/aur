# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.3.3
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python')
source=(https://github.com/mikf/${pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('6ceb948be8ff900195bf3de7b4f3598bd5251440b23f708f9781c25058f7e4ccdc129d32a4d904ac430446f168dcd49e34245fd5c1a054307fc46bcd84b1a053')
package() {
  cd "$srcdir"/${pkgname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
