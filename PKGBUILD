# Maintainer: Hans-Nikolai Viessmann <hv15 AT hw.ac.uk>
_pkgname=saxpsa
pkgname=latex-${_pkgname}-ok
pkgver=13.03.2007
pkgrel=1
pkgdesc="Provides Type 1 font compatible with displaying APL."
arch=('any')
url="http://olegykj.sourceforge.net/"
license=('custom')
depends=('texlive-core')
source=("http://olegykj.sourceforge.net/fonts/${_pkgname}_ok.zip")
md5sums=('4d9fdeb829303fdcde2d9cce9a8e69d4')

package() {
    install -d ${pkgdir}/usr/share
    cp -r ${_pkgname}/texmf ${pkgdir}/usr/share/
}

