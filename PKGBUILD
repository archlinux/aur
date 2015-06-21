#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-scinum
pkgver=2012.12
pkgrel=4
pkgdesc='A collection of scientific number classes for arbitrary precision, standard and custom units, and uncertainty for measured values.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-scinum"
depends=(python3)
source=(
  http://xyne.archlinux.ca/projects/python3-scinum/src/python3-scinum-2012.12.tar.xz
  http://xyne.archlinux.ca/projects/python3-scinum/src/python3-scinum-2012.12.tar.xz.sig
)
sha512sums=(
  6b85f5ad66ffbfa5f3c10d246b15428bc14962647465a16ee44db7838f1e25f298ed3bdbd2d6538c3f29e5d6f2457327cd79334b10a35408dddbe3a1ab770adc
  1868845c1e87af6455929333be828c906227f12c61a4498ce4f258f87a8ede90e20872a6fec0afd8c2b1759a1e4892f3b3da04c5c08ad674243bc154b1c4e9a8
)
md5sums=(
  08091b49a670628654777d95c7044ff2
  d1b6ffe697e8327e0647ca6cb1c3f365
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}


# vim: set ts=2 sw=2 et:
