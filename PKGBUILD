pkgname=go-musicfox-bin
pkgver=2.2.0
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
source=("${url}/releases/download/v${pkgver}/go-musicfox_${pkgver}_linux_amd64.zip" "https://raw.githubusercontent.com/anhoder/go-musicfox/master/LICENSE")

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/go-musicfox_${pkgver}_linux_amd64/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('c0c68d107af5ee216aac0ab52ad6bdfda924c87de3609802e4248079273df42c'
            '20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
