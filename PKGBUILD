# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

_pkgbase='wgtools'
pkgname="python-${_pkgbase}"
pkgver=1.0.0
pkgrel=2
pkgdesc='Python bindings for wireguard-tools'
arch=('any')
url="https://github.com/coNQP/${_pkgbase}"
license=('GPLv3')
depends=('python' 'wireguard-tools')
source=("${_pkgbase}::https://github.com/conqp/${_pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('2457f9062cd35de8de64132f6389cdedd8d6f5246f6f3a153bfd58a3813bb85f')


package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
