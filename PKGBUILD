# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=thinkfan-openrc
pkgver=1.2.1
pkgrel=1
pkgdesc="OpenRC init script for thinkfan - A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
url="https://github.com/MeganerdNL/thinkfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'thinkfan')
source=("https://github.com/MeganerdNL/thinkfan-openrc/archive/${pkgver}.zip")
sha256sums=('5df9fbe785c8278d463237bb3aa035fbec0e05a5480218429676b99c526073da')

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   thinkfan            "${pkgdir}/etc/init.d/thinkfan"
}
