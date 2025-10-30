# Maintainer: osoite <osoite@firemail.cc>
pkgname=ohmyvpn
pkgver=2.0.1
pkgrel=1
pkgdesc="OpenVPN integrated with pass (Standard Unix Password Manager)"
arch=('any')
url="https://git.sr.ht/~syntax/ohmyvpn"
license=('GPL3')
depends=('bash' 'procps-ng' 'openvpn' 'gnupg' 'pass')
source=("git+https://git.sr.ht/~syntax/ohmyvpn")
sha256sums=('SKIP')
install=ohmyvpn.install

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "usr/bin/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "etc/$pkgname/config.ini" "$pkgdir/etc/$pkgname/config.ini"
}

