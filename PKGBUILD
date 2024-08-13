pkgname=dnstwist
pkgver=20240812
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('Apache')
depends=("python-dnspython" "python-geoip2" "python-requests" "python-ssdeep" "python-tld" "python-whois")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elceef/dnstwist/archive/${pkgver}.tar.gz")
sha256sums=('f9f5140d8be62840c6e80aab4a988c8913fd6130a1b6340b067c49ca2989301b')

package() {
    install -D "${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    install -D "${pkgname}-${pkgver}/docs/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
