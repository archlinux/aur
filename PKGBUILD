# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>
# Contributor: Andrey Mivrenik <gim at fastmail dot fm>
# Contributor: Chaiwat Suttipongsakul <cwt at bashell dot com>
# Contributor: Chris Down <chris at chrisdown dot name>

pkgname=django-registration
pkgver=1.9
pkgrel=1
pkgdesc="A simple, generic user-registration application for Django"
arch=('any')
url='https://github.com/macropin/django-registration'
license=('BSD')
depends=('python-django')
source=("https://github.com/macropin/django-registration/archive/v${pkgver}.tar.gz")
sha256sums=('1f21f2d724e613e9f900a9901d34981e33d6e89defbfe9120719b5f02c090cf4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
