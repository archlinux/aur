# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.33
pkgrel=1
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt4' 'hunspell-en')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/v${pkgver}.tar.gz")
sha256sums=('474ee71040ae36899cc34a00c174612d286f47f8aaa1a4c66d69ece12d839c4f')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}

# -*- mode: bash;-*-
