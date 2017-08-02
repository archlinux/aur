# Maintainer: Alex Epstein <epsteina@wit.edu>

pkgname=Bash-Snippets
pkgver=1.17.3
pkgrel=1
pkgdesc="A collection of small bash scripts for heavy terminal users"
arch=('any')
url="https://github.com/alexanderepstein/Bash-Snippets"
license=("MIT")
source=("https://github.com/alexanderepstein/Bash-Snippets/archive/v$pkgver.tar.gz")
depends=("bash" "curl" "openssl" "git" "bc")
sha256sums=("84d9b06c956552c0bf0ba36c208596bb9d335f67ff2ef379c07f611e4aa080a3")

package() {
    tar -xf Bash-Snippets-v$pkgver.tar.gz
    cd Bash-Snippets-$pkgver
    ./install.sh all
}
