# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=20200424
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('Apache')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elceef/dnstwist/archive/${pkgver}.tar.gz")
md5sums=('7376b096e921d93228107ac8c15e0e73')

package() {
    install -D "${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    install -D "${pkgname}-${pkgver}/docs/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
