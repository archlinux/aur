# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname="monoosc"
pkgver=1.0.2
pkgrel=1
pkgdesc="MonoOSC is a project in two part, a library write in CSharp (C#) to use the OpenSuse Build Service (OBS) planed to propose at
MonoDevelop team and a second part will be a nice GUI who use the library."
url="monoosc.sourceforge.net"
makedepends=('rpmextract')
depends=('syntaxhighlighting' 'monoobsframework' 'rpmspecmanager' 'wget' 'mono')
arch=('i686' 'x86_64')
license=('GPL3')
source_x86_64=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/x86_64/MonoOSC-1.0.2.1-44.3.x86_64.rpm")
source_i386=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/i686/MonoOSC-1.0.2.1-44.3.i686.rpm")
if test "$CARCH" == x86_64; then
  _arch_=x86_64
else
 _arch_=i686
fi
md5sums_x86_64=("0a1ce6559f401228d3107be2a6579f6f")
md5sums_i386=("66c75626571a4a2de9637e2a2549f3c6")

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/MonoOSC-1.0.2.1-44.3.$_arch_.rpm 
}
