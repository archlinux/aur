# Maintainer: J.P. Ramackers  <jramackers@proton.me>
pkgname=pyorganize
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatically organizes files into categorized folders based on file types."
arch=('any')
url="https://github.com/ramackersjp/PyOrganize"
license=('GPL-3.0')
depends=('python')
source=("https://github.com/ramackersjp/PyOrganize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b108c37ae89657e4b1b847abdbb643315e9766ab2aba01c3feb8f03da0ab5f43')

package() {
    cd "$srcdir/PyOrganize-${pkgver}"
    
    # Installeer het script als uitvoerbaar commando
    install -Dm755 main.py "$pkgdir/usr/bin/pyorganize"
    
    # README en LICENSE
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

