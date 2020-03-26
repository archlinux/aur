# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='tablet-mode'
pkgver=2.1.0
pkgrel=3
pkgdesc='Tools to toggle a convertible laptop between laptop and tablet mode'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('adwaita-icon-theme' 'evtest' 'libnotify' 'python' 'sudo' 'systemd')
makedepends=('git' 'python-setuptools' 'python-setuptools-git' 'python-wheel')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
