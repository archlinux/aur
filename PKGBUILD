pkgname=gpt-cli
pkgver=0.0.14
pkgrel=1
pkgdesc="Run linux commands with natural language. Eg.: 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.14/gpt-cli")
sha512sums_x86_64=('b9653478daf24af90c35634c94d40cc8c1cb735137a44fdbad33264c90d2ea0051c658e86c719fab72dd461899e93caf72cde06d8c1b4127e9589e5176686a9f')

package() {
  # Install the binary
  install -Dm755 "$srcdir/gpt-cli" "$pkgdir/usr/bin/gpt-cli"

  # Create a symbolic link
  ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}

