# Contributor: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Josh Taylor <joshtaylor.mail@gmail.com>
# Contributor: simo <simo@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgbase=python38-opengl
pkgname=('python38-opengl')
pkgver=3.1.6
pkgrel=1
pkgdesc="The cross platform Python binding to OpenGL and related APIs"
url="http://pyopengl.sourceforge.net/"
license=('BSD')
arch=('any')
depends=('python38' 'freeglut')
makedepends=('python38-setuptools')
source=("https://pypi.python.org/packages/source/P/PyOpenGL/PyOpenGL-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('b6f2f083df0fd7cf8f8a1077f42fa388bce94c0edde00ed6492104af8306c9925b74649cd2c222be4205b0892e7975de2f7591d0f0bcd9540eb53c0de95fec00'
            '84e8b6e984aa53ffdce33df2f4ee8993887bdb8752617d7f66b2ff5641ca16f9c3a13b383a9bb3236192b3af9518a3f3de1e7ac9f1496c8704911bb4238d091d')

package_python-opengl() {
    cd PyOpenGL-${pkgver}
 	python3.8 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 "${srcdir}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}