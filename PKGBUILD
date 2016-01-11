# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=dnstwist
pkgver=1.02
pkgrel=2
pkgdesc="simple tool to look for registered domains similar to your own, only distinguished by typos. useful for detection of fraud and fishing attacs"
url="https://github.com/elceef/dnstwist"
arch=('any')
license=('unknown')
depends=("python-dnspython" "python-pygeoip" "python-requests" "python-ssdeep")
source=("https://github.com/elceef/dnstwist/archive/v${pkgver}.tar.gz")
md5sums=('d927ffd3f9d69c4a1df56e6648e5ded2')

package() {
    install -D "${srcdir}/${pkgname}-${pkgver}/dnstwist.py" "${pkgdir}/usr/bin/dnstwist.py"
    mkdir -p "${pkgdir}/usr/share/dnstwist/examples/"
    cp "${srcdir}/${pkgname}-${pkgver}/docs/examples/"* "${pkgdir}/usr/share/dnstwist/examples/"
}
