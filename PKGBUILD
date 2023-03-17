# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=zcfan-openrc
pkgver=1.1.0
pkgrel=1
pkgdesc="OpenRC init script for zcfan - Zero-configuration fan control for ThinkPads"
url="https://github.com/MeganerdNL/zcfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'zcfan')
makedepends=()
source=("https://github.com/MeganerdNL/zcfan-openrc/archive/${pkgver}.zip")
sha256sums=('6e0553a1bd228451d66f6c75c90e4caadfbcc342e59723ed366644d548045a34')

backup=(
    'etc/init.d/zcfan'
)

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   zcfan            "${pkgdir}/etc/init.d/zcfan"
}
