# Maintainer: Michael Herold <arch@michaeljherold.com>
# Maintainer: Ainola

pkgname=scudcloud
pkgver=1.39
_pkghash='43ddc87f123a641b1fa78ace0bab159b05d34b65'
pkgrel=2
epoch=2
pkgdesc="A Slack client for Linux"
arch=('any')
url="https://github.com/raelgc/scudcloud"
license=('MIT')
depends=('python' 'python-setuptools' 'python-dbus' 'python-pyqt5' 'qt5-webkit' 'hunspell-en')
groups=('messaging')
source=("https://github.com/raelgc/scudcloud/archive/$_pkghash.zip")
sha256sums=('993a51f975a5085a70cde345216ed8a6b9acb9ceb7bc666f61871d6c022199e0')

package() {
    cd "${pkgname}-${_pkghash}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu"**
}
