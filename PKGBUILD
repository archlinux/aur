pkgname=pass-botp
pkgver=1.0.1
pkgrel=1
pkgdesc="A pass extension for managing TOTP Backup Codes"
arch=(any)
url="https://github.com/msmol/$pkgname"
license=('GPL2')
depends=('pass')
source=("https://github.com/msmol/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('75411d6e9364d663b286e3f50819cb22fc359718eb24e6f3c586d19a4d7ab74f')
package() {
    install -Dm755 "$srcdir/pass-botp-$pkgver/src/botp.bash" "$pkgdir/usr/lib/password-store/extensions/botp.bash"
}
