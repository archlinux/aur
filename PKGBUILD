# Maintainer: Chris Billington <chrisjbillington@gmail.com>
pkgname=pydflatex
pkgver=r1.a466693d
pkgrel=3
pkgdesc="A wrapper around pdflatex which produces a short, readable, coloured output"
arch=('any')
url="https://github.com/olivierverdier/pydflatex/"
license=('BSD')
depends=('python' 'texlive-bin')
source=("${url}/archive/a466693d.zip")
sha512sums=('d48f90ecf1135bcd2654ded1c373abd64bd02d6e5582fac0cf9e30ba9dafd3cfc8b60346843dc8d34d609ec08e8a382c88d06c0aa3e171e447a0ecc266fd2613')

package() {
	cd ${srcdir}/${pkgname}-*
	python setup.py install  --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}