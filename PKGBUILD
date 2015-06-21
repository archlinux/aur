#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=bacpac
pkgver=2014
pkgrel=1
pkgdesc='Pacman-independent portable package downloader with dependency resolution.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/bacpac"
depends=(python3)
optdepends=('pyalpm: support for generating JSON provider databases')
source=(
  http://xyne.archlinux.ca/projects/bacpac/src/bacpac-2014.tar.xz
  http://xyne.archlinux.ca/projects/bacpac/src/bacpac-2014.tar.xz.sig
)
sha512sums=(
  4910e4506c5a7474517ce18b15edb796ce6e9e7958895d5ec25bfbd1330ad3620d0d97e121cdb571482124e558e5ff52852ccecfd611c28916fccd9644bffc9b
  77409d5ebd3d666dddb6f69f7da95806ed55609aeca848daaebd1546cf3acb7e2b9b4bf69ad39597449144e203da650fb25fbaa28aa04174b88ec4fa9ea3dd70
)
md5sums=(
  7f17bd2e978ab51a05665f298a6e032a
  a70c2eff3ddb0fdc00d221a3a79b9e1e
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
