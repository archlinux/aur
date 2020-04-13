# Maintainer: Joris Coenen (joris.coenen @ name of the package without -cli .io)
pkgname=secrethub-cli
pkgver=v0.37.0
pkgrel=1
pkgdesc='Command Line Interface for SecretHub'
arch=('x86_64')
url="https://github.com/secrethub/secrethub-cli"
license=('Apache')
optdepends=('xclip: Clipboard support' 'less: Improved pagination experience')
source=("https://github.com/secrethub/secrethub-cli/releases/download/$pkgver/secrethub-$pkgver-linux-amd64.tar.gz")
sha256sums=('05b6381ce152e6d5d7304bdcd25e5c55a09aafd1e61f3beaf3fe63edc1348adb')

package() {
  install -Dm755 bin/secrethub "$pkgdir"/usr/bin/secrethub
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

