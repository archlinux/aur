# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

_servicename=download_url
pkgname=obs-service-$_servicename
pkgver=0.2.1
pkgrel=1
pkgdesc="An OBS source service: download URL"
arch=('any')
url="https://github.com/openSUSE/obs-service-$_servicename"
license=('GPL2')
source=("https://github.com/openSUSE/obs-service-$_servicename/archive/$pkgver.tar.gz")
sha512sums=('c647d78e36a5a0eff6f19cd664b42e94ebaa847411455eec71294f6ded2e7c7d10bccbcaaf93bdabeff91a33a8a8f0702b11c7aa0981dba94d9c66ffa3678645')

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $_servicename "$pkgdir"/usr/lib/obs/service/$_servicename
    install -Dm644 $_servicename.service "$pkgdir"/usr/lib/obs/service/$_servicename.service
}
