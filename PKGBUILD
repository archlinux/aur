# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=20190619
pkgrel=2
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('Apache')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("$pkgname-$pkgver.tar.gz::https://github.com/elceef/dnstwist/archive/${pkgver}.tar.gz")
md5sums=('7f0445285f1209dd2a741545226e77fe')

package() {
    install -D "${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    install -D "${pkgname}-${pkgver}/docs/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
