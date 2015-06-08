# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-doc-cppref
pkgver=2006.08.06
pkgrel=2
pkgdesc="C/C++ reference documentation for eclipse help system"
url="http://eclipsedocs.sourceforge.net/"
depends=('eclipse')
arch=('any')
source=(http://downloads.sourceforge.net/eclipsedocs/yu.ac.bg.etf.seba.doc.ccppref.zip)
license=('EPL' 'GPL')

build() {
    cd ${srcdir}
    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins/
    install -d $eclipsedir
    cp -R plugins/* $eclipsedir
}

md5sums=('c7e87d22c9765a57c169925c684a6b00')
