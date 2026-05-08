pkgname=repoconductor-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Tool to manage multiple repositories'
arch=('x86_64')
url='https://github.com/shichirouji21/RepoConductor'
license=('BSD-2-Clause')
provides=('repoconductor')
conflicts=('repoconductor' 'repoconductor-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/repoconductor")
noextract=("$pkgname-$pkgver")
sha256sums=('c1374290da51848555ff7d8997af2b78b0e3eb023a53c75b2bab85999086723f')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/repoconductor"
}
