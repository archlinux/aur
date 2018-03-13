# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='requests-aws'
pkgname=('python-requests-aws' 'python2-requests-aws')
pkgver='0.1.8'
pkgrel='1'
pkgdesc='AWS authentication for Amazon S3 for the python requests module'
arch=('any')
url="https://github.com/tax/python-${pkgbase}"
makedepends=('python' 'python-setuptools'
	     'python2' 'python2-setuptools')
license=('BSD')
source=("https://pypi.io/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('bd2e8386f09d94a84b9cad6e966b21f31493734336a8f47b9b535806949a771f')

package_python-requests-aws() {
  depends=('python-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-requests-aws() {
  depends=('python2-requests')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
