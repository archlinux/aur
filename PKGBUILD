# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='blackd-systemd'
pkgver='23.3.0'
pkgrel=1
pkgdesc="systemd service and socket for blackd"
arch=('any')
url="https://github.com/psf/black"
license=('MIT')
depends=('python-black'
         'systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("blackd.service"
        "blackd.socket")
sha256sums=('23cee4d6e7e74b75d575da41f2479af352de918bee4bb91cd720b2f91d505bd3'
            '5f6230274dfa0a650f4cdf20797598036163faa386711d24446c7bcf94f97703')

package() {
    install -D -m644 -t "${pkgdir}/usr/lib/systemd/system" 'blackd.service' 'blackd.socket'
}
