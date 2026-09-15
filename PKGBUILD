# Maintainer: FraioVeio <fraiomobile@gmail.com>
pkgname=mimir-sleep
pkgver=2.0.0
pkgrel=1
pkgdesc="Drop-in sleep replacement that plays soothing sound effects while your computer is asleep"
arch=('any')
url="https://github.com/FraioVeio/mimir"
license=('MIT')
depends=('bash' 'gawk' 'sox')
source=("$pkgname-$pkgver.tar.gz::https://github.com/FraioVeio/mimir/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('76173bdd4d56edee84eb579e940094831e7a7f15c74a420c4f7e30da450edf9f')

package() {
    cd "mimir-$pkgver"

    install -Dm755 mimir.sh "$pkgdir/usr/bin/mimir"
    install -Dm644 mimir/esleep1.wav "$pkgdir/usr/share/mimir/esleep1.wav"
    install -Dm644 mimir/esleep2.wav "$pkgdir/usr/share/mimir/esleep2.wav"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
