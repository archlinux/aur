# Contributor: talavis <aur talavis eu>
pkgname=msaprobs
pkgver=0.9.7
pkgrel=1
pkgdesc="Multiple sequence alignment generator"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/msaprobs/"
license=('GPL')
depends=()
source=("http://downloads.sourceforge.net/project/msaprobs/MSAProbs-0.9.7.tar.gz")

build() {
  cd "$srcdir/MSAProbs-$pkgver/MSAProbs"
  make
}

package ()
{
  cd "$srcdir/MSAProbs-$pkgver/MSAProbs"
  install -D -m755 msaprobs $pkgdir/usr/bin/msaprobs
}

sha1sums=('c94598467805cac3f4021e982358a2d1eaa501e4')
