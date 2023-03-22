pkgname=gpt-cli
pkgver=0.0.20
pkgrel=8
pkgdesc="Run linux commands with natural language. Eg 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.20/gpt-cli.gnu")
sha512sums_x86_64=('3c0dce38eefbb4b4b6725ff692500569aa41fbbaa67233309251b867ac76a45daa900a44d3f81ff476e4be79ee78986263573b1650d36a830c5ae716942a8c2f')

package() {
# Install the binary
install -Dm755 "$srcdir/gpt-cli.gnu" "$pkgdir/usr/bin/gpt-cli"

# Create a symbolic link
ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}
