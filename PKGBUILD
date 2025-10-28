# Maintainer: Rron Nurboja <rronnurboja@gmail.com>
pkgname=electrotility
pkgver=2.0.0
pkgrel=5
pkgdesc="Ultimate Linux Power Utility Tool"
arch=('any')
url="https://github.com/Rronnurboja/electrotility"
license=('GPL3')
depends=('bash')
optdepends=(
    'curl: for downloading components'
    'wget: alternative download tool'
    'git: for some development features'
)
source=("git+https://github.com/Rronnurboja/electrotility.git")
md5sums=('SKIP')

package() {
    cd "$srcdir/electrotility"
    install -Dm755 electrotility.sh "$pkgdir/usr/bin/electrotility"
}
