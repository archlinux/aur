# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# files adapted from the Redhat OpenVAS repo. We added some options so OpenVAS
# Doesn't detect itself as a vulrnability. Not sure why these are not included
# in the arch packages now they are mainlined.

pkgname=openvas-systemd
pkgver=9
pkgrel=1
pkgdesc="systemd unit files for OpenVAS"
url="http://openvas.org"
arch=('any')
license=('GPL')
optdepends=('openvas-scanner: main program'
'openvas-manager: main program'
'greenbone-security-assistant: main program'
)

groups=('openvas')
source=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('ff707b49c68d8c39d184557541b20b6024e23956f7c18dbe79d6a50c0eacf118')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}

