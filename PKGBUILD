# Maintainer: Decrypted Epsilon <decrypted.epsilon@gmail.com>

pkgname=biojava
pkgver=3.0.8
pkgrel=1
pkgdesc="BioJava is an open-source project dedicated to providing a Java 
framework for processing biological data"
arch=('any')
url="http://biojava.org/wiki/Main_Page"
license=('LGPL2.1')
depends=('jdk7-openjdk' 'sh')
source=("http://www.biojava.org/download/bj${pkgver}/${pkgname}-${pkgver}-all.tar.gz")
md5sums=('aaf838d98d5972f9fe409aac335c5396')

package() {
  mkdir -p $pkgdir/usr/lib/jvm/java-7-openjdk/jre/lib/ext
  cp $srcdir/$pkgname-$pkgver/*/target/biojava*.jar 
"$pkgdir/usr/lib/jvm/java-7-openjdk/jre/lib/ext/."
}

