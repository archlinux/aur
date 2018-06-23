# Maintainer: KingofToasters <themanhimself at sgregoratto dot me>

pkgname=cointop
pkgver=1.0.6
pkgrel=2
pkgdesc="An interactive, real-time cryptocurrency monitor"
arch=('x86_64')
url="https://github.com/miguelmota/cointop"
license=('APACHE')
source=("$url/releases/download/$pkgver/"$pkgname"_"$pkgver"_linux_amd64.tar.gz")
sha256sums=('6da759bf9ad67b167cdf28de8bd86779a57297318fc914ab5957f8f60361b83b')

package() {
        install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
        install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
