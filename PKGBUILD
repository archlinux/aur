# Maintainer: MeganerdNL <meganerd [at] meganerd [dot] nl>

pkgname=thinkfan-openrc
pkgver=1.1.0
pkgrel=1
pkgdesc="OpenRC init script for thinkfan - A minimalist fan control program. Supports the sysfs hwmon interface and thinkpad_acpi"
url="https://github.com/MeganerdNL/thinkfan-openrc"
license=('MIT')
arch=('any')
depends=('openrc' 'thinkfan')
source=("https://github.com/MeganerdNL/thinkfan-openrc/archive/${pkgver}.zip")
sha256sums=('77640f01f4deafb44c1858bd7a19c4a7ac1316d0920905b371e3a5deeffb0a2c')

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    install -m0755 -D   thinkfan            "${pkgdir}/etc/init.d/thinkfan"
}
