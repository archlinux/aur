pkgname=gpt-cli
pkgver=0.0.19
pkgrel=7
pkgdesc="Run linux commands with natural language. Eg 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.19/gpt-cli.gnu")
sha512sums_x86_64=('0d0cf4481533013082562f8fa5474fc0015df089bb059900b0a38a3ac5b2e0b5346074a60e80e53eb288cc5db40117b57c02520c81f4c6bdd7f134fbf77413ff')

package() {
# Install the binary
install -Dm755 "$srcdir/gpt-cli.gnu" "$pkgdir/usr/bin/gpt-cli"

# Create a symbolic link
ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}
