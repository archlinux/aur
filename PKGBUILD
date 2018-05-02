# Contributor: Alexander Matyukhin <matalex1991@gmail.com>
pkgname=obnc
pkgver=0.12.0
pkgrel=1
pkgdesc="Oberon compiler"
arch=('i686' 'x86_64')
license=('GPL')
url="http://miasap.se/obnc/"
source=("http://miasap.se/obnc/downloads/obnc_0.12.0.tar.gz")
depends=("gc" "bash" "gawk")
md5sums=('32495dbccf2affa5cdf0b30432b6d57c')
sha256sums=('7bc355d3c82e9dc5571732f9cda956182cc48b74bb0c7f14ac185f67e919eb98')
sha384sums=('cb5a0ae28483d075f675d6702017b64a49795c70e2e2c06d4606fda74a644f9a5170b025aa46800af47c7fa08b1847e1')
sha512sums=('2f7fe4ce5e0e9ec71fcdb7df8badb69cc0c086d3272ff2c4c2b55dc24a37fec762b1c1563a100aa46ca528b2ba9512de252470035cb71af6828309cd203b7cd5')
build()
{
  cd $srcdir/$pkgname-$pkgver/
  pwd
  ./build --prefix=/usr
}
package()
{
  cd $srcdir/$pkgname-$pkgver/
  ./install --destdir=$pkgdir
}

