# Maintainer: Sandro Kalbermatter <info.kalsan [ät-symbol] valaiscom.ch>

pkgname=python-onkyo-eiscp
pkgver=1.2.4
pkgrel=1
pkgdesc="Control Onkyo receivers over ethernet."
arch=('any')
url="https://github.com/miracle2k/onkyo-eiscp"
license=('MIT')
depends=('python')
provides=(onkyo)
makedepends=('python-pip')
options=()
source=()
md5sums=()

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps onkyo-eiscp
}
