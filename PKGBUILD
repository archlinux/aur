# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=3.4.1
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url='http://leanprover.github.io/'
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source=("https://github.com/leanprover/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('7f0a0d7a61a79fbe8f136dbfc9f472e2b6694ab214f194d46399c6493aafeb89')

package() {
	mkdir -p "$pkgdir/usr"
    find "lean-$pkgver-linux" -exec chmod 755 {} \;
    cp -r "lean-$pkgver-linux"/* "$pkgdir/usr"
}

