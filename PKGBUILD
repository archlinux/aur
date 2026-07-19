# Maintainer: 9Sudmx <9 sudmx at proton dot me>

pkgname=beets-copyartifacts
pkgver=0.1.7
pkgrel=1
pkgdesc="A beets plugin that moves non-music files during the import process."
arch=('any')
url="https://github.com/adammillerio/$pkgname"
license=('MIT')
depends=('python' 'beets')
makedepends=()
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('7f2f9f38894916cab1d967061a27d329')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm644 beetsplug/copyartifacts.py \
    "$pkgdir/usr/lib/python3.14/site-packages/beetsplug/copyartifacts.py"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/${pkgname}/README.rst"
}
