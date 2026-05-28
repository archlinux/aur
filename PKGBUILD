pkgname=gosip
pkgver=1.0
pkgrel=1
pkgdesc="Anonymous encrypted terminal chat. No accounts. No logs. No trace."
arch=('x86_64')
url="https://github.com/Bearcry55/gosip"
license=('MIT')
depends=('glibc')
source=("gosip-linux::https://github.com/Bearcry55/gosip/releases/latest/download/gosip-linux")
sha256sums=('SKIP')

package() {
    install -Dm755 gosip-linux "$pkgdir/usr/bin/gosip"
}
