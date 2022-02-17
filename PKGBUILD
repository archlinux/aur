# Maintainer: slashformotion <slashformotion>
pkgname=python-pygame-widgets
_name=pygame-widgets
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A module for use with Pygame. Includes fully customisable buttons, textboxes and sliders, as well as the ability to create and run animations on these widgets".
arch=('any')
url="https://github.com/AustL/PygameWidgets"
license=('MIT')
groups=()
makedepends=('python-setuptools')    
conflicts=('python-pygame-widgets')
backup=()
source=(
	"https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)

md5sums=('SKIP')

package() {
	cd "${srcdir}/${_name}-${pkgver}"
	python setup.py install -O1 --root="${pkgdir}"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
