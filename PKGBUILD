# Maintainer: Ondřej Hošek <ondra.hosek@gmail.com>

pkgbase=ttf-inter
pkgname=(ttf-inter-variable ttf-inter-static otf-inter-static)
pkgver=4.1
pkgrel=1
pkgdesc='Inter is a variable font family carefully crafted & designed for computer screens.'
arch=(any)
url="https://github.com/rsms/inter"
license=(OFL-1.1)
source=("https://github.com/rsms/inter/releases/download/v${pkgver}/Inter-${pkgver}.zip")
sha256sums=('9883fdd4a49d4fb66bd8177ba6625ef9a64aa45899767dde3d36aa425756b11e')

package_ttf-inter-variable() {
	provides=("$pkgbase=$pkgver")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_ttf-inter-static() {
	provides=("$pkgbase=$pkgver")
	install -Dm0644 -t "$pkgdir/usr/share/fonts/TTF/" extras/ttf/*.ttf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}

package_otf-inter-static() {
	install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" extras/otf/*.otf
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
}
