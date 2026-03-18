pkgname=datafetch
pkgver=2.0
pkgrel=3
pkgdesc="Live system information dashboard for Linux terminals"
arch=('any')
url="https://github.com/KlodCripta/Datafetch"
license=('MIT')
depends=('bash')
source=("datafetch.sh::https://raw.githubusercontent.com/KlodCripta/Datafetch/main/datafetch.sh")
sha256sums=('8c8d4e2662876a16aac717f3dcf97deb462eeb0b5e11968a9248604d82ecdee4')

package() {
    install -Dm755 datafetch.sh "$pkgdir/usr/bin/datafetch"
}
