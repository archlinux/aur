#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=mimeo
pkgver=2015.6
pkgrel=1
pkgdesc='Open files by MIME-type or file name using regular expressions.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/mimeo"
depends=(python2 python2-xdg file)
optdepends=('MIME-types: for recognizing more MIME-types')
source=(
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2015.6.tar.xz
  http://xyne.archlinux.ca/projects/mimeo/src/mimeo-2015.6.tar.xz.sig
)
sha512sums=(
  437bd54fb20217b1454cc92fa519b13157ac56ecb66b4e2813d2c5aa2ccdd1ead5154b28f316e5420e125414bae92882e62bf496079b558f265b7544dd60566e
  0ae02ba9c842d8e27f40580140b0a0a7552b70ee0f29a8d14f8ffe0af3284d534e8967977b73c5aef9dc22771313a96351c7afb492cd39f8ab466519d11683b4
)
md5sums=(
  da9dabf4c889503d28f81f25dd6f0616
  06b2c7cfc4306188148969ac7c789d37
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
