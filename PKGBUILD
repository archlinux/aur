# Maintainer: LLL2yu <lll2yu@protonmail.com>

pkgname=gallery-dl
pkgver=1.3.2
pkgrel=1
pkgdesc="Command-line program to download image galleries and collections from pixiv, exhentai, danbooru and more"
arch=('any')
url="https://github.com/mikf/gallery-dl"
license=("GPL2")
depends=('python')
source=(https://github.com/mikf/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('19d2ec29762ab9b8e2d1fa6b2804ffc880578366ab9a1a8f7573961ba3a22be7')

package() {
  cd "$srcdir"/${pkgname}-$pkgver
  python setup.py install -O1 --root="$pkgdir"
}
