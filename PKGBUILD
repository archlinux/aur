# Maintainer: Paul Colin Hennig <aur at y dot gy>

pkgname=mozart-bin
pkgver=1.0.7
pkgrel=1
license=('AGPL')
pkgdesc="A swiss army knife for everything around the docker compose universe"
arch=('x86_64')
url="https://git.vindelicum.eu/firstdorsal/mozart"
sha256sums=('b81d2f12316d9e8ba986e4f5a8dacb7c4e8ba8e1622fd3cd94415cba3a6f7ad2')
provides=("mozart")
conflicts=("mozart")
source=("mozart-$pkgver.tar.gz::https://git.vindelicum.eu/api/v4/projects/firstdorsal%2Fmozart/packages/generic/mozart/$pkgver/mozart-$pkgver.tar.gz")


package() {
    install -Dm755 "data/mozart" "$pkgdir/usr/bin/mozart"
}
