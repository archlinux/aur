# Maintainer: Alex Epstein <epsteina@wit.edu>

pkgname=Bash-Snippets
pkgver=1.18.0
pkgrel=1
pkgdesc="A collection of small bash scripts for heavy terminal users"
arch=('any')
url="https://github.com/alexanderepstein/Bash-Snippets"
license=("MIT")
source=("https://github.com/alexanderepstein/Bash-Snippets/archive/v$pkgver.tar.gz")
depends=("bash" "curl" "openssl" "git" "bc")
sha256sums=("61602551a999448e9142489ad62d1e5da72a3b1354e010f1ee7135e4524d2eae")

package() {
    tar -xf v$pkgver.tar.gz
    cd Bash-Snippets-$pkgver
    ./install.sh all
}
