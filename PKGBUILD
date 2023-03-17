# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=zcfan-openrc
pkgver=1.1.1
pkgrel=1
pkgdesc="OpenRC init script for zcfan - Zero-configuration fan control for ThinkPads"
url="https://github.com/MeganerdNL/zcfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'zcfan')
source=("https://github.com/MeganerdNL/zcfan-openrc/archive/${pkgver}.zip")
sha256sums=('edc71fa22eef77a631b8143c37c11f0107e5b54ea951e84733f2d6528d8d8cc7')

backup=(
    'etc/init.d/zcfan'
)

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   zcfan            "${pkgdir}/etc/init.d/zcfan"
}
