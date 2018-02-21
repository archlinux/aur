# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Chris Down <chris at chrisdown dot name>

pkgname=django-registration
pkgver=2.2
pkgrel=1
pkgdesc="A simple, generic user-registration application for Django"
arch=('any')
url='https://github.com/macropin/django-registration'
license=('BSD')
depends=('python-django')
source=("https://github.com/macropin/django-registration/archive/v${pkgver}.tar.gz")
sha256sums=('87db2e03843ce214b344281d98de0a92899f58f53f0476cabb97d0b8f8624ffa')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
