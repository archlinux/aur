pkgname=datafetch
pkgver=2.1
pkgrel=2
pkgdesc="Live system information dashboard for Linux terminals"
arch=('any')
url="https://github.com/KlodCripta/Datafetch"
license=('MIT')
depends=('bash')

source=("datafetch.sh::https://raw.githubusercontent.com/KlodCripta/Datafetch/main/datafetch.sh")

sha256sums=('SKIP')

package() {
    install -Dm755 datafetch.sh "$pkgdir/usr/bin/datafetch"
}
