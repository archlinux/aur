# Maintainer: Matej Grabovsky <matej.grabovsky at gmail>
# Contributor: Naman Bharadwaj <namanbharadwaj@gmail.com>

pkgname=lean-bin
pkgver=3.1.0
pkgrel=1
pkgdesc='Lean Theorem Prover'
arch=('x86_64' 'i386')
url='http://leanprover.github.io/'
license=('Apache')
depends=('lua>=5.2')
optdepends=('emacs: emacs mode')
conflicts=('lean-git')
source=("https://github.com/leanprover/lean/releases/download/v${pkgver}/lean-${pkgver}-linux.tar.gz")
sha256sums=('a3a7afef35bb10e60ea972614f03f7aa794bbdb83b01e77773c24309696204d4')

package() {
	mkdir -p "$pkgdir/usr"
    find "lean-$pkgver-linux" -exec chmod 755 {} \;
    cp -r "lean-$pkgver-linux"/* "$pkgdir/usr"
}

