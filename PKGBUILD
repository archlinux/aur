# Maintainer: Paul Colin Hennig <aur at y dot gy>

pkgname=mozart-bin
pkgver=1.0.2
pkgrel=1
license=('AGPL')
pkgdesc="A swiss army knife for everything arround the docker compose universe"
arch=('x86_64')
url="https://git.y.gy/firstdorsal/mozart"
sha256sums=('')
provides=("mozart")
conflicts=("mozart")
source=("mozart-$pkgver.tar.gz::https://git.y.gy/api/v4/projects/firstdorsal%2Fmozart/packages/generic/mozart/$pkgver/mozart-$pkgver.tar.gz")


package() {
    install -Dm755 "data/mozart" "$pkgdir/usr/bin/mozart"
}
