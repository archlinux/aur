# Maintainer: robertfoster

pkgname=jflap
pkgver=7.1
pkgrel=1
pkgdesc="Software to learning the basic concepts of Formal Languages and Automata Theory"
arch=('i686' 'x86_64')
url="http://www.jflap.org/"
license=('CCPL')
noextract=("JFLAP$pkgver.jar")
depends=('java-environment')
source=(https://www2.cs.duke.edu/csed/jflap/jflaptmp/july27-18/JFLAP$pkgver.jar
    $pkgname.sh
    $pkgname.desktop
    $pkgname.png
)

package() {
    cd $srcdir
    install -Dm644 JFLAP$pkgver.jar $pkgdir/opt/jflap/JFLAP.jar
    install -Dm755 $pkgname.sh $pkgdir/usr/bin/jflap
    install -D -m 644 $srcdir/$pkgname.desktop \
        $pkgdir/usr/share/applications/$pkgname.desktop
    install -D -m 644 $srcdir/$pkgname.png \
        $pkgdir/usr/share/pixmaps/$pkgname.png
}

md5sums=('78075387e31ec1344b9aabc9b291a6ad'
    'fdc683f3cb88b3e336cda4a8d3b14837'
    '20407ae51fdcd2dd89fe695efe934b9d'
'9d83bfc377596e0e7d7e5f1884b3dec5')
