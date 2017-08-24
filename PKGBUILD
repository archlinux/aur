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
source=(https://gitlab.com/madflow/shrr/repository/acc5ec347ade01657de4b663b055d28404d25cab/archive.tar.gz)
noextract=()
md5sums=(e9619487a193e4a92c4216e061e2ab47)

package() {
  cd "$srcdir/$pkgname-*"
  python setup.py install --root="$pkgdir/" --optimize=1
}