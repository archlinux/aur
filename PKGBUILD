# Maintainer: Laurentiu Nicola <lnicola@dend.ro>
pkgname=certbot-systemd-nginx
pkgver=1.3
pkgrel=1
pkgdesc="Systemd service for Certbot certificate renewal with nginx servers"
arch=('any')
url="https://github.com/lnicola/certbot-systemd-nginx"
license=('MIT')
depends=('certbot' 'nginx')
replaces=('letsencrypt-systemd-nginx')
source=("git+https://github.com/lnicola/certbot-systemd-nginx.git")
md5sums=('SKIP')

package() {
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname/certbot-nginx.service" "$pkgdir/usr/lib/systemd/system/certbot-nginx.service"
    install -Dm644 "$srcdir/$pkgname/certbot-nginx.timer" "$pkgdir/usr/lib/systemd/system/certbot-nginx.timer"
}
