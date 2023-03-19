# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=zcfan-openrc
pkgver=1.1.3
pkgrel=1
pkgdesc="OpenRC init script for zcfan - Zero-configuration fan control for ThinkPads"
url="https://github.com/MeganerdNL/zcfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'zcfan')
source=("https://github.com/MeganerdNL/zcfan-openrc/archive/${pkgver}.zip")
sha256sums=('011e4d169d3f70772cc7ec787a532d8ca1ba5a99ee81c5b3d30315c761ce3248')

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   zcfan            "${pkgdir}/etc/init.d/zcfan"
}
