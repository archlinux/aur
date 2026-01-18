# Maintainer: Michael Massoni <hello@michaelmassoni.com>
pkgname=yap-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple, human-readable wrapper for yay"
arch=('x86_64')
url="https://github.com/michaelmassoni/yap"
license=('GPL3')
depends=('yay')
provides=("yap")
conflicts=("yap")
source_x86_64=("https://github.com/michaelmassoni/yap/releases/download/v${pkgver}/yap-linux-amd64"
               "https://raw.githubusercontent.com/michaelmassoni/yap/main/LICENSE")
sha256sums_x86_64=('49f36e212b1d20531f82b72192a912c4b2451fd87df9feb9e5132a78e5e4c503'
                   '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
	install -Dm755 "${srcdir}/yap-linux-amd64" "${pkgdir}/usr/bin/yap"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
