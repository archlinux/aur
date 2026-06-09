# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=msmtpq-systemd
url="https://codeberg.org/VannTen/msmtpq-systemd"
pkgver=1.0.0
pkgrel=1
pkgdesc="Systemd unit for queuing and sending mail"
arch=(any)
license=('MIT')
groups=()
depends=(msmtp)
source=("$pkgname-$pkgver::$url")
sha512sums=('SKIP')

package() {

    make -C "$pkgname-$pkgver" DESTDIR=$pkgdir install
    install -Dm 644 "$pkgname-$pkgver"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
