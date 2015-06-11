# Contributor: feufochmar <feufochmar.gd@gmail.com>
pkgname=otf-gnutypewriter
pkgver=20110624
pkgrel=2
pkgdesc="A free font imitating a real typewriter."
arch=('any')
url="http://openfontlibrary.org/font/gnutypewriter"
license=('custom:OFL')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=gnutypewriter.install
source=("http://openfontlibrary.org/assets/downloads/gnutypewriter/8a7cb57723df9125503083ed59e7a11c/gnutypewriter.zip")

package() {
  cd "$srcdir"
  mkdir -p  "$pkgdir"/usr/share/fonts/OTF
  install -m644 *.otf "$pkgdir"/usr/share/fonts/OTF/
} 
md5sums=('8a7cb57723df9125503083ed59e7a11c')
