# Maintainer: Tomasz Morawski (Kerrex) <romen3@linux.pl>

pkgname=openfm
pkgver=3.0.4.188
pkgrel=2
pkgdesc="Open FM on your PC. Faster access to your favorite stations."
arch=('i686' 'x86_64')
url=http://open.fm/
license=(Freeware)
depends=('alsa-lib' 'libcanberra' 'libcanberra-pulse' 'xorg-server' 'flashplugin')
install=$pkgname.install
provides=($pkgname)
if test "$CARCH" == x86_64; then
	source=(http://updates.open.fm/files/elwood/release/linux64)
	md5sums=(6876a88f3b4f4eac451915181ea0540b)
else
	source=(http://updates.open.fm/files/elwood/release/linux32)
	md5sums=(9a73ee16871e11909622ea55a3eab56f)
fi



package()
{
  mkdir -p $pkgdir/opt/OpenFM
  cp -R $srcdir/OpenFM $pkgdir/opt/
}
