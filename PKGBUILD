pkgname=repoconductor-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool to manage multiple repositories'
arch=('x86_64')
url='https://github.com/shichirouji21/RepoConductor'
license=('BSD-2-Clause')
provides=('repoconductor')
conflicts=('repoconductor' 'repoconductor-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/repoconductor")
noextract=("$pkgname-$pkgver")
sha256sums=('3ff33d7535fb56bcf25f0a93429971c174e940f3d9c0587a2e64fa0f667e8831')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/repoconductor"
}
