# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Lincoln de Sousa <lincoln@archlinux-br.org>

pkgname=python2-cjson
pkgver=1.2.2
pkgrel=1
arch=('x86_64')
license=('LGPL')
pkgdesc="Fast JSON encoder/decoder for Python"
url="https://github.com/AGProjects/python-cjson"
depends=('python2')
source=("https://files.pythonhosted.org/packages/1d/89/cfb31c0901456208effc914e3b293666b16a720f825ce96914bd07a32072/python-cjson-$pkgver.tar.gz")
sha256sums=('3006c2c218297be3448dc793218e0b15d20fe9839775521bfc294fc6aa24972b')

package() {
  cd "$srcdir"/python-cjson-$pkgver
  python2 setup.py install --root="$pkgdir"
}
