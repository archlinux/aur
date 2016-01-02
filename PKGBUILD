# Maintainer: GI_Jack <iamjacksemail@hackermail.com>

# files adapted from the Redhat OpenVAS repo. We added some options so OpenVAS
# Doesn't detect itself as a vulrnability. Not sure why these are not included
# in the arch packages now they are mainlined.

pkgname=openvas-systemd
pkgver=8
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
sha256sums=('2fc5a01dee9cd018ce1415a8a839ebb07a0b9465342a0dd068de320043a8b599')


package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp -ra . "${pkgdir}"
}

