# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=20190425
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('unknown')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("https://github.com/elceef/dnstwist/archive/${pkgver}.tar.gz")
md5sums=('b5d06b8d72cd3fa8710fed4231912797')

package() {
    install -D "${srcdir}/${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    mkdir -p "${pkgdir}/usr/share/dnstwist/examples/"
    cp "${srcdir}/${pkgname}-${pkgver}/docs/examples/"* "${pkgdir}/usr/share/dnstwist/examples/"
}
