pkgname=repoconductor-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Tool to manage multiple repositories'
arch=('x86_64')
url='https://github.com/shichirouji21/RepoConductor'
license=('MIT')
provides=('repoconductor')
conflicts=('repoconductor' 'repoconductor-git')
source=("$pkgname-$pkgver::${url}/releases/download/v${pkgver}/repoconductor")
noextract=("$pkgname-$pkgver")
sha256sums=('567762fde93602d933b391e4ef60639106b22485e3f79b2f60170543bf87dfa2')

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver" \
                 "$pkgdir/usr/bin/repoconductor"
}
