# Contributor: Piotr Beling <qwak@w8.pl>
pkgname=eclipse-jpox
pkgver=1.1.1
pkgrel=2
pkgdesc="Java Persistent Objects (JPOX) eclipse plugin"
arch=(i686 x86_64)
url="http://www.jpox.org/"
license=('APACHE')
depends=('eclipse')
source=("http://dl.sourceforge.net/sourceforge/jpox/org.jpox.ide.eclipse_${pkgver}.zip")
md5sums=('1dedbf2482f1e1fc1a8f21482ba2bf45')

build() {
    install -d ${startdir}/pkg/usr/share/eclipse/
    cp -r $startdir/src/plugins ${startdir}/pkg/usr/share/eclipse/
}
