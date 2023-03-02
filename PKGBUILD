# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=zcfan-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRC init script for zcfan - Zero-configuration fan control for ThinkPad"
url="https://github.com/MeganerdNL/zcfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'zcfan')
makedepends=()
source=("https://github.com/MeganerdNL/zcfan-openrc/archive/${pkgver}.zip")
sha256sums=('e730503944354d109b80c8397d9a2660eeaf770d4570419f439336a9c93ff3e4')

backup=(
    'etc/init.d/zcfan'
)

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   zcfan            "${pkgdir}/etc/init.d/zcfan"
}
