#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python2-xynehttpserver
pkgver=2012.12.24.2
pkgrel=4
pkgdesc='Python BaseHTTPServer classes extended with authentication, SSL, and threading.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python2-xynehttpserver"
depends=(python2)
conflicts=(python-xynehttpserver)
source=(
  http://xyne.archlinux.ca/projects/python2-xynehttpserver/src/python2-xynehttpserver-2012.12.24.2.tar.xz
  http://xyne.archlinux.ca/projects/python2-xynehttpserver/src/python2-xynehttpserver-2012.12.24.2.tar.xz.sig
)
sha512sums=(
  5e3bc9d4ea24174ebddc55bd6c22df7c9af4ba7128db6d3bc0aa0338288ad411e2bb91997643393d021b6a46dd3543b7b8388bd779ff21eb29db1b5672985a74
  663f953f8a5401b84fb34d13c9821954a72ac8b7b8cbd8fd7693b925f7bd832957e25cf214b27cecaee1c4530dff15a7ad0fbb2664471c93752897dfc9d92605
)
md5sums=(
  8a46c0f1a4cdedb78c6a1e733cdb1d27
  d283c42a46f283f13b6c33e74eb7efdc
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
