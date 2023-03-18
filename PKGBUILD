# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=zcfan-openrc
pkgver=1.1.2
pkgrel=1
pkgdesc="OpenRC init script for zcfan - Zero-configuration fan control for ThinkPads"
url="https://github.com/MeganerdNL/zcfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'zcfan')
source=("https://github.com/MeganerdNL/zcfan-openrc/archive/${pkgver}.zip")
sha256sums=('40b5184aa52a791e83a30246cc1c1ed5a56f7a845a75f4a23511b07415a93a1c')

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   zcfan            "${pkgdir}/etc/init.d/zcfan"
}
