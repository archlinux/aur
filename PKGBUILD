# Maintainer: Groctel <aur@taxorubio.com>

pkgname=latex-template-aqademia
_name=aqademia
pkgver=3.0
pkgrel=1
pkgdesc="A LaTeX template for printable academic documents."
url="https://github.com/Groctel/aqademia"
license=('GPL-2.0')
source=("https://github.com/Groctel/aqademia/archive/refs/heads/main.zip")
arch=('any')
sha512sums=('9610967dd8c839d1359c6be9c2a4a10ac2d92be0ee33c9fe4283be07f7344d3d1ed39aaa2b9fcbfad254a36583e0d8d858ce4aa80a09cac285336bdbae2e14a2')
depends=('texlive-core')

package() {
	cd ${srcdir}/${_name}-main/
	mkdir -p ${pkgdir}/usr/share/texmf-dist/tex/latex/${_name}/
	install -m 0644 -D aqademic.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${_name}/aqademic.cls
}

