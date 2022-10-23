# Maintainer: icepie, icepie.dev@gmail.com

pkgname=bt-dualboot
_pkgname=bt_dualboot
pkgver=1.0.1
pkgrel=1
pkgdesc="Sync Bluetooth for dualboot Linux and Windows"
arch=('any')
url="https://github.com/x2es/bt-dualboot"
license=('GPL3')
provides=('bt-dualboot')
conflicts=('bt-dualboot')
makedepends=('git' 'python-installer' 'python-wheel')
depends=(
	'python'
    'chntpw'
)
source=('https://files.pythonhosted.org/packages/42/82/c3e1bfca558d8a5f7dd51183ba0f1a3d2061f5442bfa54821398bb3813b8/bt_dualboot-1.0.1-py3-none-any.whl')
sha256sums=('779ec46a4911a54918b08cf9d80a481697287c3017b38873a0152ca5e0520820')

package() {
	python -m installer --destdir="$pkgdir" "$_pkgname"-"$pkgver"-py3-none-any.whl
}