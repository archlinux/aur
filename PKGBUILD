# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=3.4.2
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url='http://leanprover.github.io/'
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source=("https://github.com/leanprover/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('ba8a97b3e8f28dad50900a55e488579f2a26923eb0c4c40342120457c136d165')

package() {
    mkdir -p "$pkgdir/usr"
    cp -r "$srcdir/lean-$pkgver-linux"/* "$pkgdir/usr"
}

