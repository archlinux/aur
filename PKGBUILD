pkgname=dnstwist
pkgver=20250130
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('Apache')
depends=("python-dnspython" "python-geoip2" "python-requests" "python-ssdeep" "python-tld" "python-whois")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elceef/dnstwist/archive/${pkgver}.tar.gz")
sha256sums=('67593491a64b7dd93e8e8b58ec24863f0e51327177b81efa513ad04b8e5b1a49')

package() {
    install -D "${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    install -D "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
