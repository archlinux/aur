# Maintainer: Michal Siedlaczek <siedlaczek at pm dot me>
pkgname=python-protonvpn-cli
pkgver=2.2.4
pkgrel=1
pkgdesc="Linux command-line client for ProtonVPN written in Python."
arch=('any')
url="https://github.com/ProtonVPN/linux-cli"
license=('GPL3')
depends=('python-docopt' 'python-requests' 'python-pythondialog' 'python-jinja' 'openvpn' 'dialog')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/e5/02/cb47cf1b7dade730317e9be4712c74ba42cb722fc1557d34e5a4f1d19c80/protonvpn_cli-2.2.4.tar.gz")
md5sums=('27879d95b5433e426d2ffbbff097eaa8')

package() {
    cd protonvpn_cli-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1
}
