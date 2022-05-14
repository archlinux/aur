# Maintainer: Daniel Menelkir <dmenelkir at gmail dot com>

pkgname=ananicy-cpp-openrc
pkgver=20220109
pkgrel=3
pkgdesc=T"Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage"
arch=('any')
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=('GPLv3')
depends=('ananicy-cpp-nosystemd' 'openrc' 'bash' 'schedtool')
_filename=('ananicy-cpp.openrc')
sha256sums=('SKIP')
source=('ananicy-cpp.openrc')

package() {
    install -dm755 "$pkgdir/etc/init.d"
    install -Dm755 "$srcdir/ananicy-cpp.openrc" "$pkgdir/etc/init.d/ananicy-cpp"
}
