# Maintainer: Victoria Mitchell <victoria@quietmisdreavus.net>
pkgname=git-htmldocs
pkgver=2.27.0
pkgrel=2
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
sha256sums=('ffa91681b6a8f558745924b1dbb76d604c9e52b27c525c6bd470c0123f7f4af3'
            'SKIP')
validpgpkeys=('96E07AF25771955980DAD10020D04E5A713660A7') # Junio C Hamano

package() {
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc" *.html
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc/howto" howto/*.html
    install -Dm644 -t "$pkgdir/usr/share/doc/git-doc/technical" technical/*.html
}
