# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-pyaml-env
_pkgname=${pkgname#python-}
pkgver=1.2.1
pkgrel=3
pkgdesc='Zero-dependency Python package for easy throttling with asyncio support'
arch=('any')
url="https://github.com/mkaranasou/pyaml_env"
license=('MIT')
depends=('python-yaml')
makedepends=('python-setuptools')
source=($_pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('889caaf2845055a63cdb4df8d3a00027088a8b4f28b631ff8eaa6470fccfa941')

package() {
  cd "$srcdir/pyaml_env-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
