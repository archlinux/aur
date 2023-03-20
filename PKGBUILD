pkgname=gpt-cli
pkgver=0.0.16
pkgrel=3
pkgdesc="Run linux commands with natural language. Eg 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.16/gpt-cli.gnu")
sha512sums_x86_64=('f5928d437a5bd6b26a74ac1274e7f1debb66def517bd89f0d8e39900f2ad2d60cc306302403d3286326e5d057b25a9b2a394564203f8a5a5061ce03809082004')

package() {
# Install the binary
install -Dm755 "$srcdir/gpt-cli.gnu" "$pkgdir/usr/bin/gpt-cli"

# Create a symbolic link
ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}