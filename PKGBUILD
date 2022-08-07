# Maintainer: Christiyan Petrov <nightly at abv dot bg>

pkgname=ananicy-cpp-dinit
pkgver=20220808
pkgrel=2
pkgdesc="Ananicy Cpp is a full rewrite of Ananicy in C++, featuring lower CPU and RAM usage. (dinit service)"
arch=('any')
url="https://gitlab.com/ananicy-cpp/ananicy-cpp/"
license=('GPL3')
depends=('ananicy-cpp-nosystemd' 'dinit' 'bash')
_filename=('ananicy-cpp.dinit')
sha256sums=('SKIP')
source=('ananicy-cpp.dinit')

package() {
    install -dm755 "$pkgdir/etc/dinit.d"
    install -Dm755 "$srcdir/ananicy-cpp.dinit" "$pkgdir/etc/dinit.d/ananicy-cpp"
}
