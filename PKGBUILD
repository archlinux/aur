# Contributor: Piotr Beling <qwak@stud.ics.p.lodz.pl>

pkgname=eclipse-doc-j2se
pkgver=6.0
pkgrel=2
pkgdesc="java documentation for eclipse help system"
url="http://eclipsedocs.sourceforge.net/"
depends=('eclipse')
arch=('any')
source=(http://downloads.sourceforge.net/eclipsedocs/yu.ac.bg.etf.seba.doc.jdk${pkgver/./}.zip)
license=('EPL' 'GPL')

build() {
    cd ${srcdir}
    local eclipsedir=${pkgdir}/usr/share/eclipse/dropins
    install -d $eclipsedir
    cp -R plugins/* $eclipsedir
}

md5sums=('2150570e62010fba4219ae99a92b0cb0')
