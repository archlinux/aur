# Contributor: Chris Allison <chris.allison@hotmail.com>

pkgbase=python2-xmltv
pkgname=python2-xmltv
pkgver=1.3
pkgrel=1
pkgdesc="A Python Module for Reading and Writing XMLTV Files (python2 version)"
arch=('any')
url="https://code.google.com/p/python-xmltv/"
license=('LGPL')
makedepends=('python2-setuptools')
source=("https://python-xmltv.googlecode.com/files/python-xmltv-${pkgver}.tar.gz")
sha256sums=('3f7878790252669b59f252e057ea05cfa71c23962b7d140d8c91c65239410ff8')

package()
{
    depends=("python2")

    cd python-xmltv-${pkgver}

    python2 setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
    install -Dm644 README.html "$pkgdir"/usr/share/doc/$pkgname/README.html
}
