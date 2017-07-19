# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Chris Down <chris at chrisdown dot name>

pkgname=django-registration
pkgver=1.7
pkgrel=1
pkgdesc="A simple, generic user-registration application for Django"
arch=('any')
url='https://github.com/macropin/django-registration'
license=('BSD')
depends=('python-django')
source=("https://github.com/macropin/django-registration/archive/${pkgver}.tar.gz")
sha256sums=('00787acdf8dc71b0b94ab8620a228a1479d4c9003fca21ee736e5ab3383d2117')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
