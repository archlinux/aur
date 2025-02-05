# Maintainer: devome <evinedeng@hotmail.com>

pkgname=oppleio
_pkgname=pyoppleio-legacy
_pipname=${_pkgname//-/_}
pkgver=1.0.8
pkgrel=1
pkgdesc="Interfacing with opple light of the old firmware versions."
url="https://github.com/tinysnake/python-oppleio-legacy"
arch=('any')
license=('MIT')
depends=('python-crc16')
makedepends=('python-installer')
source=("${_pipname}-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/py3/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}-py3-none-any.whl")
sha256sums=('a86ecf4f331d26cf8249a4f7754c131b9fe7749bcbccc63978ec870b62a7341e')
noextract=("${_pipname}-${pkgver}-py3-none-any.whl")

package() {
    python -m installer --destdir="${pkgdir}" "${_pipname}-${pkgver}-py3-none-any.whl"
}
