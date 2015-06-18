pkgname=nemo-megasync
pkgver=1.0.29
pkgrel=1
pkgdesc="MEGASync extension for the Nemo file browser"
arch=('x86_64' 'i686')
url="http://www.webupd8.org/2014/09/unofficial-megasync-nemo-extension.html"
license=('custom')
depends=('nemo' 'megasync')
if [ "$CARCH" = "x86_64" ]; then
    source=(https://github.com/hotice/webupd8/raw/master/nemo-megasync_${pkgver}-0~webupd8~0_amd64.deb)
    md5sums=('89f4ac0edbc2118f5c543c10d40a3327')
else
    source=(https://github.com/hotice/webupd8/raw/master/nemo-megasync_${pkgver}-0~webupd8~0_i386.deb)
    md5sums=('a8a16be4c6572e33870e34d2d87c1f16')
fi

package()
{
    msg "Extracting"
    tar -xf ${srcdir}/data.tar.xz -C ${pkgdir}
}
