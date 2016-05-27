# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.24
pkgrel=1
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt4' 'hunspell-en')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('75a035d920b305720e2723146a92444eb087ef6420b0140c415962e73234927d')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}

# -*- mode: bash;-*-
