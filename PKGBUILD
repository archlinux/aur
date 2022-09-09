# Maintainer: Groctel <aur@taxorubio.com>

_name=aqademia

pkgname=latex-template-aqademia
pkgver=3.0
pkgrel=3
pkgdesc="A LaTeX template for printable academic documents."

arch=('any')
license=('GPL-2.0')
url="https://gitlab.com/Groctel/aqademia"

source=("$url/-/archive/main/aqademia-main.zip")
sha512sums=('48d1cb0426fb45b311c8a9984f245e202629610163643930a9d6e91409afb12397fb6b8e09df7dfc84ca688546c52a9832af6afcb4ddce3272cf7c918d388343')

depends=('texlive-core')

package ()
{
	cd ${srcdir}/${_name}-main/
	install -m 0644 -D aqademic.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${_name}/aqademic.cls
}
