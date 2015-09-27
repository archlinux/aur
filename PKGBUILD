# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=i3-workspace-switch
pkgver=0.1
pkgrel=1
pkgdesc="Utility to allow switching workspaces by their position on the output"
arch=(any)
url="https://github.com/languitar/i3-workspace-switch"
license=('LGPL3')
depends=('python2' 'python-i3-git')
makedepends=('git' 'python-setuptools')
source=("https://github.com/languitar/i3-workspace-switch/archive/release-${pkgver}.tar.gz")
md5sums=('f9ce4bf9cd5ae2fb6ec2d34e4dbdf2b1')

package() {
    cd "${pkgname}-release-${pkgver}"
    python3 setup.py install --root="$pkgdir/"
}
