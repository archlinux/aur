# Contributor: Chris Allison <chris.allison@hotmail.com>

pkgbase=python2-dvbstreamer
pkgname=pydvbstreamer
project=dvbstreamer
pkgver=0.1
pkgrel=1
pkgdesc="python control modules for dvbstreamer (https://aur4.archlinux.org/packages/dvbstreamer/)"
arch=("any")
url="http://sourceforge.net/projects/${project}/"
license=("GPLv2")
makedepends=("python2-setuptools")

source=("http://downloads.sourceforge.net/project/${project}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('33e23f0f9305e12f27bebae585a494340e4d5b152c0512d9bbe2201a08a7b5e5')

prepare()
{
    rm -rf ${pkgname}-${pkgver}/build
}
package()
{
    cd ${pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
