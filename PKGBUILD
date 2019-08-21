# Maintainer: Benjamin Winger <bmw at disroot dot org>

pkgname=portmod-migrate
pkgver=0.1.2
pkgrel=1
pkgdesc="A tool to help migrate from manually installed OpenMW mods to Portmod"
provides=('portmod-migrate')
conflicts=('portmod-migrate')
arch=(any)
url="https://gitlab.com/portmod/portmodmigrate"
license=(GPL3)
depends=("python" "portmod" "python-fuzzywuzzy")
makedepends=("python" "python-setuptools" "python-setuptools-scm")
source=("https://gitlab.com/portmod/portmodmigrate/-/archive/v$pkgver/portmodmigrate-v$pkgver.tar.gz")
sha512sums=('9bc47ba19f3c954de644ebdf3b13532a81eef5f5d3e9c47f29e2eb9123dbb9977276ca3a0a8b0019a9667089f845a17f8fdc77fb1872aa5a55a165b22a2bd6de')

package() {
  cd "$srcdir/portmodmigrate-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
