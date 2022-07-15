#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=bacpac
pkgver=2014
pkgrel=4
pkgdesc='Pacman-independent portable package downloader with dependency resolution.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/bacpac"
depends=(python3)
optdepends=('pyalpm: support for generating JSON provider databases')
source=(
  https://xyne.dev/projects/bacpac/src/bacpac-2014.tar.xz
  https://xyne.dev/projects/bacpac/src/bacpac-2014.tar.xz.sig
)
sha512sums=(
  4910e4506c5a7474517ce18b15edb796ce6e9e7958895d5ec25bfbd1330ad3620d0d97e121cdb571482124e558e5ff52852ccecfd611c28916fccd9644bffc9b
  840652eb0dac9f704177c3ef5c28265063cb6ba3fc3261ddba02fa00f4193febe06fa87a90a131516c11f8fd44aa53e53f6b80d684c8c73d13219d152ca177eb
)
md5sums=(
  7f17bd2e978ab51a05665f298a6e032a
  34454ad43863c289ece477c42df4d642
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
