# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=('fbuild')
pkgver=0.3rc2
_pkgver=0.3-rc2
pkgrel=1
pkgdesc="A cross platform, high performant caching build system "
arch=('any')
url="https://github.com/felix-lang/fbuild"
license=('BSD' 'PSFL')
makedepends=('python' 'python-setuptools')
source=("https://github.com/felix-lang/fbuild/archive/v$_pkgver.tar.gz")
sha256sums=('311404401e979ec0f49cc5d9d995f04d822ef03b2c8d4e304d547d6f99969642')
package() {
  cd "$pkgname-$_pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
