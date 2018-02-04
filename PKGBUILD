# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# files adapted from the Redhat OpenVAS repo. We added some options so OpenVAS
# Doesn't detect itself as a vulrnability. Not sure why these are not included
# in the arch packages now they are mainlined.

pkgname=openvas-systemd
pkgver=10
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
sha256sums=('bfe0d8757aa593982fe352c7246b4b7def4a808dcbf608c6eec12d3320b80647')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}

