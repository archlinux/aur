# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=3.2.0
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url='http://leanprover.github.io/'
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source=("https://github.com/leanprover/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('33eafbeddeaf80c3da8d5ebfa17c58bb61e5f68424a190d2d50b1afc2a3ed241')

package() {
	mkdir -p "$pkgdir/usr"
    find "lean-$pkgver-linux" -exec chmod 755 {} \;
    cp -r "lean-$pkgver-linux"/* "$pkgdir/usr"
}

