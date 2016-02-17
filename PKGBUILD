# Maintainer: Tomoki Imai <tomo832@gmail.com>
pkgname=texlive-jlisting
pkgver=0.2
pkgrel=1
pkgdesc="Listings for Japanese."
arch=('any')
url="http://mytexpert.sourceforge.jp/index.php?Listings"
license=("public domain")
groups=()
depends=('texlive-core' 'texlive-bin')
makedepends=('nkf')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="jlisting.install"
changelog=

source=("http://sourceforge.jp/frs/redir.php?m=iij&f=/mytexpert/26068/jlisting.sty.bz2")
md5sums=("a8a5830151d7799fc0ce05132d205d44")

build(){
    cd $srcdir/
}

package(){
    cd $srcdir/
    nkf -w --overwrite jlisting.sty
    mkdir -p $pkgdir/usr/share/texmf-dist/tex/latex/listings
    cp jlisting.sty $pkgdir/usr/share/texmf-dist/tex/latex/listings
}


