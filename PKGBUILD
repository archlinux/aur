pkgname=go-musicfox-bin
pkgver=3.0.2
pkgrel=1
pkgdesc='Command-line Netease Cloud Music written in Go.'
url='https://github.com/anhoder/go-musicfox'
license=('MIT')
arch=('x86_64')
source=(
	"${url}/releases/download/v${pkgver}/go-musicfox_${pkgver}_linux_amd64.zip"
	"LICENSE"
)

package() {
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/go-musicfox_${pkgver}_linux_amd64/musicfox" "${pkgdir}/usr/bin/musicfox"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=('281e2996bb5ce66cf611755ee1532e736933ab65bf7bd6485f06ede289c93ee4'
            '20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54')
