# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname="syntaxhighlighting"
pkgver=1.0.1.3
pkgrel=1
pkgdesc="C# API SyntaxHighlighting, to color text,html, xml and spec."
url="monoosc.sourceforge.net"
makedepends=('mono' 'pulseaudio')
arch=('i686' 'x86_64')
license=('GPL3')
install=syntaxhighlighting.install
source_x86_64=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/x86_64/SyntaxHighlighting-1.0.1.3-57.3.x86_64.rpm")
source_i386=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/i686/SyntaxHighlighting-1.0.1.3-57.3.i686.rpm")
md5sums_x86_64=("3732f40fc9554555a6093b8f984c5104")
md5sum_i386=("361f87918ca0e493fade282f6af5be58")
if test "$CARCH" == x86_64; then
  _arch_=x86_64
else
 _arch_=i686
fi

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/SyntaxHighlighting-1.0.1.3-57.3.$_arch_.rpm 
}
