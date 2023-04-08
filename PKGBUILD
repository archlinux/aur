# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-doctest-ignore-unicode
pkgver=0.1.2
_commit=ee9412fd155ebf47c42974696d31e6a1510cffa0
pkgrel=6
pkgdesc="Nose plugin to ignore unicode literal prefixes in doctests"
arch=(any)
url="https://github.com/gnublade/doctest-ignore-unicode"
license=('Apache')
depends=('python-nose')
makedepends=('python-setuptools')
source=("https://github.com/gnublade/doctest-ignore-unicode/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('f2295cd01d8278eb167da6207d6675444c22f78e2738e82296e555d93a6e68998ffc98c3a5e81ed5e2dadfcea38a2ae2a91a2a732b9533eb36c4c0cc315bdd84')

package() {
  cd doctest-ignore-unicode-$_commit
  python setup.py install --root="$pkgdir" --optimize=1
}
