# Do not edit PKGBUILD directly. Edit PKGBUILD.tpl and update the setup.json file

# Maintainer: madflow <madflow@web.de>
pkgname=shrr
pkgver=0.1.1
pkgrel=1
pkgdesc="Share files via HTTP"
arch=('any')
url="https://gitlab.com/madflow/shrr"
license=(MIT)
groups=()
depends=('python>=3.3' 'python-flask')
makedepends=('python-setuptools' 'python-pip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://gitlab.com/madflow/shrr/uploads/8fbbb075695c61427816039d46173821/shrr-0.1.1-py3-none-any.whl)
noextract=()
md5sums=('5c303a33178da9917df6b11c8a8c8adf')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
}
