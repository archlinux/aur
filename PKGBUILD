# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=thinkfan-openrc
pkgver=1.2.0
pkgrel=1
pkgdesc="OpenRC init script for thinkfan - A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
url="https://github.com/MeganerdNL/thinkfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'thinkfan')
source=("https://github.com/MeganerdNL/thinkfan-openrc/archive/${pkgver}.zip")
sha256sums=('31fd99bca3f1501f70f354f591be510dd7ea77bef1e0071ba3852d9f90670d98')

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   thinkfan            "${pkgdir}/etc/init.d/thinkfan"
}
