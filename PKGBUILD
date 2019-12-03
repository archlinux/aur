pkgname=javassist
pkgver=r3.26.0_GA
pkgrel=1
pkgdesc='Java bytecode engineering toolkit since 1999'
arch=('x86_64')
url='https://www.javassist.org/'
source=("git://github.com/jboss-javassist/javassist.git")
sha256sums=('SKIP')

package() {
    cd $srcdir/$pkgname
    git checkout rel_3_26_0_ga
    mkdir -p $pkgdir/usr/share/java
    cp javassist.jar $pkgdir/usr/share/java/
}
