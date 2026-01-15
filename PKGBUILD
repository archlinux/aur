# Maintainer: Camila 'Mocha' Rose
pkgname=astra
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple AUR helper written in Ruby"
arch=('any')
url="https://git.gay/mochacinno-dev/astra"
license=('GNU GPLv3')
depends=('ruby' 'git' 'base-devel' 'pacman')
makedepends=('git')
source=("git+${url}.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/astra"
    # Install the main executable
    install -Dm755 astra "$pkgdir/usr/bin/astra"

    install -Dm644 README.md "$pkgdir/usr/share/doc/astra/README.md"
}