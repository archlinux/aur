# Maintainer: Valerio Pizzi (Pival81) <pival81@yahoo.com>

pkgname="rpmspecmanager"
pkgver=1.0.0.0
pkgrel=1
pkgdesc="This tool provide help for write SPEC file to build RPM, it work in
snippet like style, the final goal should be to manage a fully
project, with make the tar.bz2 archive and start the build of the RPM,
we think also about a autocompletion like style."
makedepends=('rpmextract')
depends=('syntaxhighlighting')
arch=('i686' 'x86_64')
license=('GPL3')
source_x86_64=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/x86_64/RpmSpecManager-1.0.0.0-115.3.x86_64.rpm")
source_i386=("http://download.opensuse.org/repositories/home:/surfzoid/Fedora_20/i686/RpmSpecManager-1.0.0.0-115.3.i686.rpm")
if test "$CARCH" == x86_64; then
  _arch_=x86_64
else
 _arch_=i686
fi
md5sums_x86_64=("f695060ffd76715e1367745cdd0f7059")
md5sums_i386=("1a96e1cdd0f25ed1c293acc986172199")

package() {
	cd $pkgdir
	rpmextract.sh $srcdir/RpmSpecManager-1.0.0.0-115.3.$_arch_.rpm
}
