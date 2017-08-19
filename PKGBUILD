pkgname=pass-botp
pkgver=1.0.1
pkgrel=1
pkgdesc="A pass extension for managing TOTP Backup Codes"
arch=(any)
url="https://github.com/msmol/$pkgname"
license=('GPL2')
depends=('pass')
makedepends=('git')
source=("https://github.com/msmol/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    install -Dm755 "$srcdir/pass-botp-$pkgver/src/botp.bash" "$pkgdir/usr/lib/password-store/extensions/botp.bash"
}
