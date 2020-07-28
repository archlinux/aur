# Maintainer: Victoria Mitchell <victoria@quietmisdreavus.net>
pkgname=git-htmldocs
pkgver=2.28.0
pkgrel=1
pkgdesc="HTML documentation files for Git"
arch=('any')
url="https://git-scm.com/"
license=('GPL2')
groups=()
depends=('git')
makedepends=()
checkdepends=()
optdepends=()
source=("https://www.kernel.org/pub/software/scm/git/$pkgname-$pkgver.tar."{xz,sign})
sha256sums=('24feed3b584e2121418de9bde9f2e23fdcf78e4f914279787f669d3dc375bfe6'
            'SKIP')
validpgpkeys=('96E07AF25771955980DAD10020D04E5A713660A7') # Junio C Hamano

package() {
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc" *.html
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc/howto" howto/*.html
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc/technical" technical/*.html
}
