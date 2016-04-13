# Maintainer: Laurentiu Nicola <lnicola@dend.ro>
pkgname=letsencrypt-systemd-nginx
pkgver=1.0
pkgrel=1
pkgdesc="Systemd service for Let's Encrypt certificate renewal with nginx servers"
arch=('any')
url="https://github.com/lnicola/letsencrypt-systemd-nginx"
license=('MIT')
depends=('letsencrypt')
source=("git+https://github.com/lnicola/letsencrypt-systemd-nginx.git")
md5sums=('SKIP')

package() {
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname/letsencrypt-nginx.service" "$pkgdir/usr/lib/systemd/system/letsencrypt-nginx.service"
    install -Dm644 "$srcdir/$pkgname/letsencrypt-nginx.timer" "$pkgdir/usr/lib/systemd/system/letsencrypt-nginx.timer"
}
