# Maintainer: Benjamin Winger <bmw at disroot dot org>

pkgname=portmod-migrate
pkgver=0.2.1
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
sha512sums=('7bdaaf822e24bc0c90aada588c907e2191690e03ead41fb4b625aed925a24a2acad2509a0c33e74cb46d0161a8be7c198a3a3122cdedadebee86e978ed4e0dbd')

package() {
  cd "$srcdir/portmodmigrate-v$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python setup.py install --root $pkgdir
}
