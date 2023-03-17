# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=thinkfan-openrc
pkgver=1.0.0
pkgrel=1
pkgdesc="OpenRC init script for thinkfan - A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
url="https://github.com/MeganerdNL/thinkfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'thinkfan')
source=("https://github.com/MeganerdNL/thinkfan-openrc/archive/${pkgver}.zip")
sha256sums=('87868bd0cefac8aa74fa34d713551c8c81e8357c0537a8481593b9426b94fe7c')

backup=(
    'etc/init.d/thinkfan'
)

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   thinkfan            "${pkgdir}/etc/init.d/thinkfan"
}
