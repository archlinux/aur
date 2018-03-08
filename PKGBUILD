# Maintainer: portaloffreedom

_pkgsrcname=pulsectl
pkgname=python-pulse-control
pkgver=18.3.1
pkgrel=1
pkgdesc="Python high-level interface and ctypes-based bindings for PulseAudio (libpulse)"
url="http://github.com/mk-fg/python-pulse-control"
license=("MIT")
arch=("any")
depends=('python' 'pulseaudio')
source=("https://pypi.python.org/packages/5e/5f/b5d9a3728ca062b811c337e1e7c19d12ec3f95f13a511141c43ada5def94/$_pkgsrcname-$pkgver.tar.gz#md5=43ae095362d39b270df8cf3368fd7999")
md5sums=('43ae095362d39b270df8cf3368fd7999')

package() {
  cd $srcdir/${_pkgsrcname}-$pkgver
  python3 setup.py install --root $pkgdir
  rm -rf $pkgdir/usr/lib/python3.6/site-packages/$_pkgsrcname/tests/
}


