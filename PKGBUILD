# Maintainer: jmcb <joelsgp@protonmail.com>

pkgname='blackd-systemd'
pkgver='23.3.0'
pkgrel=3
pkgdesc="systemd service for blackd, the uncompromising Python code formatter daemon"
arch=('any')
url="https://github.com/psf/black"
license=('MIT')
depends=('python-black'
         'python-aiohttp'
         'systemd')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
source=("blackd.service")
sha256sums=('470c44b5f3671aa604558e2d393e4ca9a8122094903bbaf1d0a91fe1ee090151')

package() {
    install -D -m644 -t "${pkgdir}/usr/lib/systemd/system" 'blackd.service'
}
