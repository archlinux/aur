# Maintainer: Paul Colin Hennig <aur at y dot gy>

pkgname=mozart-bin
pkgver=1.0.4
pkgrel=1
license=('AGPL')
pkgdesc="A swiss army knife for everything around the docker compose universe"
arch=('x86_64')
url="https://git.y.gy/firstdorsal/mozart"
sha256sums=('5bf1c1debb20751a1c62757368abbb2acf57c935e08f1c812d4bc8db637a92e6')
provides=("mozart")
conflicts=("mozart")
source=("mozart-$pkgver.tar.gz::https://git.y.gy/api/v4/projects/firstdorsal%2Fmozart/packages/generic/mozart/$pkgver/mozart-$pkgver.tar.gz")


package() {
    install -Dm755 "data/mozart" "$pkgdir/usr/bin/mozart"
}
