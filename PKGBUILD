# Maintainer: Agam Singh <agam@agamsingh.me>
pkgname=bip39-generator
pkgver=1.2.0
pkgrel=1
pkgdesc="BIP-39 Mnemonic Generator with optional user provided and keyboard entropy"
arch=('any')
url="https://codeberg.org/FortisCard/bip39-generator"
license=('Apache-2.0')
depends=('python' 'python-mnemonic')
makedepends=('git')
source=("git+https://codeberg.org/FortisCard/bip39-generator.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  pwd
  install -Dm755 src/bip39.py "$pkgdir/usr/bin/bip39"
}

