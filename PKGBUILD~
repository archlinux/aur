# Maintainer: Alex Epstein <epsteina@wit.edu>

pkgname=Bash-Snippets
pkgver=1.16.0
pkgrel=2
pkgdesc="A collection of small bash scripts for heavy terminal users"
arch=('any')
url="https://github.com/alexanderepstein/Bash-Snippets"
license=("MIT")
source=("https://github.com/alexanderepstein/Bash-Snippets/archive/v$pkgver.tar.gz")
depends=("bash" "curl" "openssl" "git")
sha256sums=("19a029a204f16bd4db30cf7fa32aa6953dd10dcb996138b9bc65c01612afaac7")

package() {
    tar -xf Bash-Snippets-v$pkgver.tar.gz
    cd Bash-Snippets-$pkgver
    ./install.sh all
}
