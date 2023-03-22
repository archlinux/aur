pkgname=gpt-cli
pkgver=0.0.17
pkgrel=5
pkgdesc="Run linux commands with natural language. Eg 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.17/gpt-cli.gnu")
sha512sums_x86_64=('ffe7fd8479450d0df164e73e7c760be624ffa6fe2f96463ccf0a31f103177e5974dcf2160a9425e5b8218bb84e258c415f9b5419072cbe26b698e1cc20c43d30')

package() {
# Install the binary
install -Dm755 "$srcdir/gpt-cli.gnu" "$pkgdir/usr/bin/gpt-cli"

# Create a symbolic link
ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}
