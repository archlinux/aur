# Do not edit PKGBUILD directly. Edit PKGBUILD.tpl and update the setup.json file

# Maintainer: madflow <madflow@web.de>
pkgname=shrr
pkgver=0.1.3_dev
pkgrel=1
pkgdesc="Share files via HTTP"
arch=('any')
url="https://gitlab.com/madflow/shrr"
license=(MIT)
groups=()
depends=('python>=3.3' 'python-flask' 'python-netifaces' 'python-colorama')
makedepends=('python-setuptools' 'python-pip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/madflow/shrr/repository/3e7bc82cdc8bd7fb2f25ec7bcf2cf87d1beb86ef/archive.tar.gz)
noextract=()
md5sums=(698db547cfd7a3332b9b6d2b43f9d701)

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}