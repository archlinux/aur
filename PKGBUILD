# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=cup
pkgver=20160615
pkgrel=1
pkgdesc="LALR parser generator for Java"
arch=('any')
url="http://www2.cs.tum.edu/projects/cup/index.php"
license=('StandardMLofNJ')
depends=('java-environment' 'bash')
source=("http://www2.cs.tum.edu/projects/cup/releases/java-cup-bin-11b-${pkgver}.tar.gz"
        "cup.sh")
sha384sums=('8b6deb85a3084f155d205fe1f09c6be913a3c897c4d0d1da60d1ad52696317e4a93abf979778d361b53b846ef0f7c92e'
            '9ddcd1f4fb3fd94891ad8ea65b4dc9f1221a8f06b5865b40d11f8cb07726ff917357f811c8e9b5c5c3ecb7b833b2e341')

package() {
    cd "$srcdir/"
    install -m644 -D java-cup-11b.jar "$pkgdir/usr/share/java/$pkgname/java-cup-11b.jar"
    install -m644 -D java-cup-11b-runtime.jar "$pkgdir/usr/share/java/$pkgname/java-cup-11b-runtime.jar"
    install -m755 -D cup.sh "$pkgdir/usr/bin/cup"
}
