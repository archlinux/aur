# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-pyaml-env
_pkgname=${pkgname#python-}
pkgver=1.2.2
pkgrel=1
pkgdesc='Zero-dependency Python package for easy throttling with asyncio support'
arch=('any')
url="https://github.com/mkaranasou/pyaml_env"
license=('MIT')
depends=('python-yaml')
makedepends=('python-setuptools')
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d41db1ae48fd7c06984bc733204f57d466a9a9f3fd5f731380237343c7f7d751')

package() {
  cd "$srcdir/pyaml_env-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
