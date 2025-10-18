# Maintainer: Rron Nurboja <rronnurboja@gmail.com>
pkgname=electrotility
pkgver=2.0.0
pkgrel=2
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
source=("electrotility.sh::https://raw.githubusercontent.com/Rronnurboja/electrotility/main/electrotility.sh")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/electrotility.sh" "$pkgdir/usr/bin/electrotility"
}
