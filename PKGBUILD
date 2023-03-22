pkgname=gpt-cli
pkgver=0.0.18
pkgrel=6
pkgdesc="Run linux commands with natural language. Eg 'show my graphic card' instead 'lspci | grep VGA'"
arch=('x86_64')
url="https://github.com/gustawdaniel/gpt-cli"
license=('MIT')
depends=('xorg-server-devel' 'libxcb')
options=()
source_x86_64=("https://github.com/gustawdaniel/gpt-cli/releases/download/v0.0.18/gpt-cli.gnu")
sha512sums_x86_64=('eabba0d6f0743390cf0d169133799617079dc1c878f4fdd66db57eb8768af347945303e458209e4ae5d174079e78b239d0ed48e97379fa9be6b16e160ddfd913')

package() {
# Install the binary
install -Dm755 "$srcdir/gpt-cli.gnu" "$pkgdir/usr/bin/gpt-cli"

# Create a symbolic link
ln -s "/usr/bin/gpt-cli" "$pkgdir/usr/bin/p"
}
