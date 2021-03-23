# Maintainer: BigfootACA <bigfoot@classfun.cn>

_pyname=django-discover-runner
pkgname=python-$_pyname
pkgver=1.0
pkgrel=1
pkgdesc="A Django test runner based on unittest2's test discovery."
arch=(any)
url="http://github.com/jezdez/django-discover-runner"
license=(BSD)
depends=(
	python
	python-django
)
makedepends=(python-setuptools)
source=(https://pypi.io/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz)
md5sums=('23d377cdcc5f1c2e1bcc5b508e6da4a7')
sha256sums=('0ba91fe722c256bcbfdeb36fac7eac0f27e5bfda55d98c4c1cf9ab62b5b084fe')
sha512sums=('669287ed7f801dbfe949e2affd9ee1861aa6a41fcc2e2403dc2e106dee3d23c8400d686ef750242bdc74d23eaf316fcf36071c82d7c458ff724305e5fe27410e')

package(){
	cd $_pyname-$pkgver
	python setup.py install --root "$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
