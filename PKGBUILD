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
source=(https://gitlab.com/madflow/shrr/repository/0e915c059ecd5012d8a823292cc3a57e020196b9/archive.tar.gz)
noextract=()
md5sums=(6b3771a78f96229d82d8af3029cb0007)

package() {
  cd "$srcdir/$pkgname-0e915c059ecd5012d8a823292cc3a57e020196b9-0e915c059ecd5012d8a823292cc3a57e020196b9"
  python setup.py install --root="$pkgdir/" --optimize=1
}