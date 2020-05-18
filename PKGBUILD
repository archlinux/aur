# Maintainer: Colin Wallace <colin@mooooo.ooo>
pkgname=('python-urldecode')
_pkgname=urldecode
pkgver=0.1
pkgrel=2
pkgdesc='URLDecode is to decode an encoded url'
arch=(any)
url=http://pypi.python.org/pypi/urldecode
license=(GPL)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d1/b3/550b96212bc353ed911600085675115109c9cf042aeb4c126f7366417d25/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('52b6a6dd23b82b514eb3502c9bb50bd9d4eb61676285f8bfd3f776dee6f11571')

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
