# Maintainer: Jonathan Kirszling <jkirsz@gmail.com>
pkgname=upaste
pkgrel=1
pkgver=0.1.0
pkgdesc="Paste and upload files on ix.io and x0.at"
arch=('any')
url="https://github.com/eoli3n/$pkgname"
license=('UNLICENSE')
source=("up"
		"UNLICENSE")
sha256sums=("32987e5f3547a041930a6ddfc3bfe440489b23bb1cd70948b63168d93797b960"
"6b0382b16279f26ff69014300541967a356a666eb0b91b422f6862f6b7dad17e")

package() {
	install -Dm755 'up' "${pkgdir}/usr/bin/up"
	install -Dm644 'UNLICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
}
