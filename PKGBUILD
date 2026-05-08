pkgname=repoconductor-bin
pkgver=1.0.0
pkgrel=1
pkgdesc='Tool to manage multiple repositories'
arch=('x86_64')
url='https://github.com/shichirouji21/RepoConductor'
license=('BSD-2-Clause')
provides=('repoconductor')
conflicts=('repoconductor' 'repoconductor-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/repoconductor")
noextract=("$pkgname-$pkgver")
sha256sums=('64cdc782c4783162af75de8cde6e763bc5fdaffa413b983508d237e5461b7df5')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/repoconductor"
}
