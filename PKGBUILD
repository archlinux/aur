# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.4.0
pkgrel=1
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt4' 'hunspell-en')
groups=('messaging')
install=${pkgname}.install
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('5d764e25d0ae2c1b09b9271ab754e74063d1bb710a5aa9bcc2ceccf113768169')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}

# -*- mode: bash;-*-
