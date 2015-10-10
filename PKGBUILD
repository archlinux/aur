# Maintainer: Ianis G. Vasilev <mail@ivasilev.net>

pkgname=psmouse-alpsv7-dkms
pkgver=20140319
pkgrel=4
pkgdesc='psmouse kernel module with support for alpsv7 touchpad'
arch=('any')
url='https://github.com/he1per/psmouse-dkms-alpsv7'
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')
source='git://github.com/he1per/psmouse-dkms-alpsv7.git'
md5sums=('SKIP')

package() {
    cd 'psmouse-dkms-alpsv7'
    sudo ./install.sh
}
