# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname='python-colorlog'
pkgver='2.7.0'
pkgrel=1
pkgdesc="Log formatting with colors"
arch=('any')
url='https://pypi.python.org/pypi/colorlog'
license=('MIT')
depends=('python')
makedepends=('python-pip')
conflicts=('python-colorlog-git')
source=('https://pypi.python.org/packages/95/59/c70e535f1b3b8eab2279dc58dc5ce1a780eb83efccefa55ca745dc7f02ee/colorlog-2.7.0.tar.gz')
md5sums=('54709d93ee29bf61a2163e3019f4460e')

package() {
    cd "${srcdir}/colorlog-${pkgver}"
 	echo :: Installing for python>=3 ...
    pip3 install --isolated --prefix=/usr --root="${pkgdir}" --no-deps --ignore-installed .
}

