# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: zer0def <zer0def@github>
#
_python="python3"
_name="qr-tools"
_subname="qrtools"
_ubuntur="0~39~ubuntu20.04.1"
pkgname="python-${_subname}"
pkgver="2.0"
pkgrel="4"
pkgdesc="A high level library for reading and generating QR codes."
url="https://launchpad.net/qr-tools"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('python' 'python-pillow' 'python-zbar' 'qrencode')
source=("${pkgname}-${pkgver}.tar.gz::https://launchpad.net/~${_name}-developers/+archive/ubuntu/daily/+sourcefiles/python3-qrtools/${pkgver}-${_ubuntur}/python3-qrtools_${pkgver}-${_ubuntur}.tar.gz")
sha256sums=('25f500a6c78929cd048a8c5c39d84ef2592f4419029e8499937af69ed27337fc')

package() {
    cd "${_python}-${_subname}-${pkgver}"
    install -D -m644 qrtools.py ${pkgdir}/usr/lib/python3.8/site-packages/qrtools.py
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
