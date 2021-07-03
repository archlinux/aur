# Maintainer: Groctel <aur@taxorubio.com>

pkgname=latex-template-aqademia
_name=aqademia

pkgver=3.0
pkgrel=2
pkgdesc="A LaTeX template for printable academic documents."

arch=('any')
license=('GPL-2.0')
url="https://github.com/Groctel/aqademia"

source=("https://github.com/Groctel/aqademia/archive/refs/heads/main.zip")
sha512sums=('50326f4cee69f7def7e4eeddb5b3ae56c922549be859f998e4277aa79bc3cfa72817200f560f8cca1d985348436dfba6b143204d45bec607cb53fab5ef803fa9')
depends=('texlive-core')

package ()
{
	cd ${srcdir}/${_name}-main/
	install -m 0644 -D aqademic.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${_name}/aqademic.cls
}
