#  Maintainer: Greg Flynn <gregflynn42 at gmail dot com>

pkgname="pulse-sms"
pkgver="3.1.1"
pkgrel=1
pkgdesc="A native desktop implementation of Pulse"
arch=('x86_64')
url="https://messenger.klinkerapps.com/"
depends=('gconf' 'libnotify' 'libxtst' 'nss' 'libxss')

source=(
    "https://github.com/klinker24/messenger-desktop/releases/download/v${pkgver}/pulse-sms-${pkgver}-amd64.deb"
)
sha512sums=(
    "8926a11d37de57917d802b3b35dbd974051ef79db0cedc83daa0fd61e18602e8ec4b1d03c6cb72abe9e60d169a653635b63af0025ae19c9eb1b785bdbc334656"
)

package() {
    tar -xf data.tar.xz -C "$pkgdir"
}
