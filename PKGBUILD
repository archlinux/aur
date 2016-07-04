# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname="monoobsframework"
pkgver=1.0.2
pkgrel=1
pkgdesc="A library write in CSharp (C#) to use the OpenSuse Build Service (OBS) planed to propose at MonoDevelop
team"
url="monoosc.sourceforge.net"
makedepends=('rpmextract')
arch=('i686' 'x86_64')
license=('GPL3')
install=monoobsframework.install
source_x86_64=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/x86_64/MonoOBSFramework-1.0.2.1-44.3.x86_64.rpm")
source_i386=('http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/i686/MonoOBSFramework-1.0.2.1-44.3.i686.rpm')
if test "$CARCH" == x86_64; then
  _arch_=x86_64
else
 _arch_=i686
fi
md5sums_x86_64=("3d4c3d66bd50b37609513ac13d7a9a5b")
md5sums_i386=("93e97e19618d2c02d3a00e1afb577eb5")

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/MonoOBSFramework-1.0.2.1-44.3.$_arch_.rpm 
}
