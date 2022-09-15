# Maintainer: Benjamin Winger <bmw at disroot dot org>

pkgname=portmod-migrate
pkgver=0.2.2
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
sha512sums=('6c92c6c825efe76fea1409a11b259e2618dabdfb4dce9f07717023586b6147f9206fa4f57e6ce255c61847ff77ac602c1adc7907f8696d654f1e6feead578893')

package() {
  cd "$srcdir/portmodmigrate-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
