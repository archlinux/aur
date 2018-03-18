# Maintainer: Katoga <katoga.cz@hotmail.com>
pkgname=terraform-index-bin
pkgver=0.0.2
pkgrel=1
pkgdesc='A simple tool which prints the AST of a HCL file'
arch=('x86_64')
url="https://github.com/mauve/terraform-index"
license=('BSD')
source=(
	"https://github.com/mauve/terraform-index/releases/download/${pkgver}/terraform-index-${pkgver}-linux-amd64.zip"
	'LICENSE'
)
sha256sums=(
	'b10de458b0414a76ea2e18d3ebe3df54e212e09a4b64f8fefecf9f08e906b2d1'
	'8d30e4d4e52fc07a98e90dcbbe71284520019b51b4beb95509b12a04e2cc5cf5'
)

package() {
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/terraform-index" "${pkgdir}/usr/local/bin/terraform-index"
}
