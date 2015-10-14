# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=1
pkgrel=1
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('unknown')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("https://github.com/elceef/dnstwist/archive/v1.00.tar.gz")
md5sums=('b3e0ea47d9527f9e078ae926d13632b7')

package() {
    install -D "${srcdir}/${pkgname}-1.00/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    mkdir -p "${pkgdir}/usr/share/dnstwist/examples/"
    cp "${srcdir}/${pkgname}-1.00/examples/"* "${pkgdir}/usr/share/dnstwist/examples/"
}
