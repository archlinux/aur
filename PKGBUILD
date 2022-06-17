# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgbase='requests-aws'
pkgname='python-requests-aws'
pkgver='0.1.8'
pkgrel='2'
pkgdesc='AWS authentication for Amazon S3 for the python requests module'
arch=('any')
url="https://github.com/tax/python-${pkgbase}"
makedepends=('python' 'python-setuptools')
depends=('python-requests')
license=('BSD')
source=("https://pypi.io/packages/source/${pkgbase:0:1}/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('bd2e8386f09d94a84b9cad6e966b21f31493734336a8f47b9b535806949a771f')

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}
