#Maintainer: Xyne <ac xunilhcra enyx, backwards>
pkgname=python3-currencyconverter
pkgver=2016
pkgrel=1
pkgdesc='Module and command-line tool for currency conversion and rate retrieval.'
arch=(any)
license=(GPL)
url="http://xyne.archlinux.ca/projects/python3-currencyconverter"
depends=(python-xdg python3 python3-memoizedb)
source=(
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.tar.xz
  http://xyne.archlinux.ca/projects/python3-currencyconverter/src/python3-currencyconverter-2016.tar.xz.sig
)
sha512sums=(
  db335ec83d9878d48083e1529a5b0ccd642180d8a8fe02a8a27d158fe05a2bd98ea75686d7645472531177fb0a660abcb4ce22610e595939e56607baea074719
  a90586e256f4f1ddfe708f004072870c9fd9dc89b4c8a1e962089928d42da1b93fd57f5e8cac3c28f154f29ef747ab8ab675f169e99382eff1144dc0baf0d7dc
)
md5sums=(
  c0687704d8a43bb406a3d8fe483db942
  a22e46f3e29168f6b452917310e8ea32
)
validpgpkeys=('EC3CBE7F607D11E663149E811D1F0DC78F173680')

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 currency_converter "$pkgdir"/usr/bin/currency_converter
}


# vim: set ts=2 sw=2 et:
