# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-gnutypewriter
pkgver=20110624
pkgrel=6
pkgdesc="A free font imitating a real typewriter."
arch=('any')
url="http://openfontlibrary.org/font/gnutypewriter"
license=('OFL-1.1')
depends=()
source=("http://openfontlibrary.org/assets/downloads/gnutypewriter/8a7cb57723df9125503083ed59e7a11c/gnutypewriter.zip"
        "OFL.txt")

package() {
  install -vDm644 ../OFL.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  cd "$srcdir"
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
} 
md5sums=('8a7cb57723df9125503083ed59e7a11c'
        '969851e3a70122069a4d9ee61dd5a2ed')
