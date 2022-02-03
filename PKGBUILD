# Maintainer: manijamali <manijamali2003@gmail.com>

pkgname=pyabr
pkgver=2.3.0
pkgrel=1
pkgdesc=' Pyabr lightweight OS with Python and Qt '
url='https://pyabr.ir'
arch=('any')
license=('GPL3')
depends=('xorg-server' 'mesa' 'qt5-base' 'python-wheel' 'python-pyqt5' 'breeze' 'breeze-icons' 'wget' )
makedepends=('python-pip')
optdepends=('xterm' 'mpv' 'chromium' 'python-pyalsa' 'python-pyaudio' 'openbox')
provides=("${pkgname%}")
conflicts=("${pkgname%}")

package() {
    sudo pip install --upgrade pyabr
}
