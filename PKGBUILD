# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=port_to_qt5
_pkghash=6bcd877daea3d679cd5fd2c946c2d933940c48d9
pkgrel=1
epoch=1
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt5' 'hunspell-en')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/$_pkghash.zip")
sha256sums=('b75f1e83766ebd27d48bc797b9539bbdc7c1af421c725cfb1b52a47766ae7429')

package() {
    cd "${pkgname}-${_pkghash}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
