# Maintainer: Tomasz Morawski (Kerrex) <romen3@linux.pl>

pkgname=openfm
pkgver=4.0.0.1
pkgrel=1
pkgdesc="Open FM on your PC. Faster access to your favorite stations."
arch=('i686' 'x86_64')
url=http://open.fm/
license=(Freeware)
depends=('alsa-lib' 'libcanberra' 'libcanberra-pulse' 'xorg-server' 'flashplugin')
install=$pkgname.install
provides=($pkgname)
if test "$CARCH" == x86_64; then
	source=(http://updates.open.fm/files/elwood/release/linux64)
	md5sums=(8a71b06408ee3303492d09004db37381)
else
	source=(http://updates.open.fm/files/elwood/release/linux32)
	md5sums=(c7d4e091aa590e75e2790984decbb6cc)
fi



package()
{
  mkdir -p $pkgdir/opt/OpenFM
  cp -R $srcdir/OpenFM $pkgdir/opt/
}
