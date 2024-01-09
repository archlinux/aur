# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Peter Crighton <PeteCrighton@gmail.com>
# Maintainer: otaj < ota.jasek at proton dot me>

pkgname=python-hiyapyco
_name=hiyapyco
pkgver=0.5.4
pkgrel=1
pkgdesc="A Hierarchical Yaml Python Config"
arch=('any')
url="https://github.com/zerwes/hiyapyco"
license=('GPL3')
depends=('python-yaml' 'python-jinja' 'python-markupsafe')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/zerwes/hiyapyco/archive/release-$pkgver.tar.gz")
md5sums=('2052e8896e3881e7e711bbe848c698c9')

package() {
	cd "$srcdir/hiyapyco-release-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
