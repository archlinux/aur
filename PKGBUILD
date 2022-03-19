pkgname=go-musicfox-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
source=("${url}/releases/download/v${pkgver}/musicfox.linux" "https://raw.githubusercontent.com/anhoder/go-musicfox/master/LICENSE")

package() {
	install -d "${pkgdir}/usr/local/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/musicfox.linux" "${pkgdir}/usr/local/bin/musicfox"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('SKIP' 'SKIP')
sha256sums=('f2c75f9ff10db6e4a73b0bcb4128ecfbfb6887bccb0b6da64aebe1d574de5cc0'
            '20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
