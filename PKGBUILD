# Maintainer: Groctel <aur@taxorubio.com>

_name=aqademia

pkgname=latex-template-aqademia
pkgver=3.0
pkgrel=2
pkgdesc="A LaTeX template for printable academic documents."

arch=('any')
license=('GPL-2.0')
url="https://gitlab.com/Groctel/aqademia"

source=("$url/-/archive/main/aqademia-main.zip")
sha512sums=('4f644217a4fca8446a71ee72427d8e70e2d07b07d9606d51eb1ba14f308965b874e971d5002c73ea57a45fd6c2ae60ae209973657e14e5f984949398210972c0')

depends=('texlive-core')

package ()
{
	cd ${srcdir}/${_name}-main/
	install -m 0644 -D aqademic.cls ${pkgdir}/usr/share/texmf-dist/tex/latex/${_name}/aqademic.cls
}
