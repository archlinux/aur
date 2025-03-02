# Maintainer: Agam Kohli <agamkohli9@gmail.com>
_pkgname=bip39-generator
pkgname=$_pkgname-git
pkgver=1.0.0
pkgrel=1
pkgdesc="BIP39 Mnemonic Generator with optional user provided and keyboard entropy"
arch=('any')
url="https://github.com/agamkohli9/bip39-generator"
license=('MIT')
depends=('python' 'python-mnemonic')
makedepends=('git')
source=("git+https://github.com/agamkohli9/bip39-generator.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  pwd
  install -Dm755 src/bip39.py "$pkgdir/usr/bin/bip39"
}

