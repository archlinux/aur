#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=python2-xynehttpserver
pkgver=2021
pkgrel=1
pkgdesc='Python BaseHTTPServer classes extended with authentication, SSL, and threading.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/python2-xynehttpserver"
depends=(python2)
conflicts=(python-xynehttpserver)
source=(
  https://xyne.dev/projects/python2-xynehttpserver/src/python2-xynehttpserver-2021.tar.xz
  https://xyne.dev/projects/python2-xynehttpserver/src/python2-xynehttpserver-2021.tar.xz.sig
)
sha512sums=(
  22297c601311a18c30b4fddfc4e8e8b3237bbcd30f726ede565787bc27cb795b79c26fa11776c2c0f69bc7a236ca3278c14eba6ec2726d992dc32ff13c5fbd00
  10e9d58d873846c9fe00c397db43624949d0b86896a4eb3c285b3f46ce620e2d8c56ddd0e3256ec6ba03337ab66b57b1493f84270da946572ed8f47098d284ef
)
md5sums=(
  835411d3289233d0702c7a90496e7bc2
  007e385775fbfe2a1416a85cfa0c20a3
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
