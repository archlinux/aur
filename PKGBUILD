# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase=python-pam
pkgname=("python-pam" "python2-pam")
pkgver=1.8.2
pkgrel=1
pkgdesc="Module that provides an authenticate function that allows the caller to authenticate a given username / password against the PAM system on Linux."
url="https://github.com/FirefighterBlu3/python-pam"
license=('MIT')
arch=('any')
depends=('pam')
makedepends=('python-setuptools' 'python2-setuptools')
source=("http://pypi.python.org/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('26efe4e79b869b10f97cd8c4a6bbb04a4e54d41186364e975b4108c9c071812c')

package_python-pam() {
  depends=('python')

	cd "$srcdir/${pkgbase}-${pkgver}"
	python setup.py install --root="$pkgdir"
}

package_python2-pam() {
  depends=('python2')

	cd "$srcdir/${pkgbase}-${pkgver}"
	python2 setup.py install --root="$pkgdir"
}
