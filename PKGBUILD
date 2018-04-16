# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Chris Down <chris at chrisdown dot name>

pkgname=django-registration
pkgver=2.4
pkgrel=1
pkgdesc="A simple, generic user-registration application for Django"
arch=('any')
url='https://github.com/macropin/django-registration'
license=('BSD')
depends=('python-django')
source=("https://github.com/macropin/django-registration/archive/v${pkgver}.tar.gz")
sha256sums=('ff3c01ca599875b180de8e1bd3316dab719b2d3f80b2400bf1447b25e48dcee4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
