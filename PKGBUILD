# Maintainer: Martin Patz <mailto at martin-patz.de>

_name=indicator-sound-switcher
pkgname=indicator-sound-switcher-git
pkgver=2.3.5.2
pkgrel=2
pkgdesc='Sound input/output selector indicator for Linux.'
license=('GPL3')
arch=('i686' 'x86_64')
url='https://github.com/yktoo/indicator-sound-switcher'
makedepends=('python-setuptools')
depends=('python' 'python-gobject' 'libkeybinder3' 'libappindicator-gtk3' 'pulseaudio')
provides=('indicator-sound-switcher')
conflicts=('indicator-sound-switcher')
source=(https://github.com/yktoo/${_name}/archive/v${pkgver}.tar.gz)
md5sums=('49c836b5d20c505a32971f4fbd2182af')

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root='${pkgdir}' --optimize=1
}
