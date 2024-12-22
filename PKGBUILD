# Maintainer: halsschmerzen <bastiansteampl@gmail.com>

pkgname=quickrice
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple CLI tool for managing desktop themes"
arch=('any')
url="https://github.com/halsschmerzen/quickrice"
license=('MIT')
depends=('bash') 
source=("git+https://github.com/halsschmerzen/quickrice.git")
sha256sums=('SKIP') 

build() {
    cd "$srcdir/$pkgname"
    # Ensure the install.sh script is executable
    chmod +x install.sh
}

package() {
    cd "$srcdir/$pkgname"
    # Run the install.sh script locally, passing the target installation directory
    ./install.sh install --global
}
