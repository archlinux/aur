# Maintainer: Supernovatux <thulashitharan.d at gmail dot com>

pkgname=libpam-pwdfile-rs-bin
_pkgname=libpam-pwdfile-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple PAM module to authenticate users against a password file"
url="https://github.com/Supernovatux/libpam-pwdfile-rs"
license=("MIT")
arch=("x86_64")
provides=("libpam-pwdfile-rs")
conflicts=("libpam-pwdfile-rs")
depends=("pam")
source=("https://github.com/Supernovatux/$_pkgname/releases/download/v$pkgver/$_pkgname-$pkgver-$CARCH.tar.gz")
sha512sums=("c1d95bc2bc494ec3bca5fd2538175502b858774d3e9c9b80d79a02da1518ffc1668b75c16b63778941f2688908d13cdfb1ea2605d2d35f4794ba10ade86fde99")

package() {
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/libpam_pwdfile_rs.so" "$pkgdir/usr/lib/security/pam_pwdfile_rs.so"
    install -Dm444 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

