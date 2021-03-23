# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=django-utils-six
pkgname=python-$_pyname
pkgver=2.0
pkgrel=1
pkgdesc="Forward compatibility django.utils.six for Django 3"
arch=(any)
url="https://github.com/whtsky/django-utils-six"
license=(BSD)
depends=(
	python
	python-django
)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('49c1b156a1faaacc6ded7a5259ac5107')
sha256sums=('4ef9d20de679a5b2448429476452493661fe08f23d6e788a8e9816ec05e3c5b0')
sha512sums=('35269eaf47f3e159431996f6d750a5e3644d8c28209535a5aa04b01d770045ae05c0319ce7c1f6fab3f60bc5584b890cb3a0811a330c8989cac4f7bddf2641da')

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
