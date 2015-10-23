# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=1
pkgrel=2
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('unknown')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("https://github.com/elceef/dnstwist/archive/v1.0.tar.gz")
md5sums=('f75f9d794305aa86dedc12764586a250')

package() {
    install -D "${srcdir}/${pkgname}-1.0/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    mkdir -p "${pkgdir}/usr/share/dnstwist/examples/"
    cp "${srcdir}/${pkgname}-1.0/examples/"* "${pkgdir}/usr/share/dnstwist/examples/"
}
