# Maintainer: Paul Colin Hennig <aur at y dot gy>

pkgname=mozart-bin
pkgver=1.0.3
pkgrel=1
license=('AGPL')
pkgdesc="A swiss army knife for everything around the docker compose universe"
arch=('x86_64')
url="https://git.y.gy/firstdorsal/mozart"
sha256sums=('496ddcb40345cf7d70f1ab6f1846f1f2ac4f8dc3696955ab57ba0322ac02fd7f')
provides=("mozart")
conflicts=("mozart")
source=("mozart-$pkgver.tar.gz::https://git.y.gy/api/v4/projects/firstdorsal%2Fmozart/packages/generic/mozart/$pkgver/mozart-$pkgver.tar.gz")


package() {
    install -Dm755 "data/mozart" "$pkgdir/usr/bin/mozart"
}
