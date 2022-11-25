# Maintainer: Mikhail felixoid Shiryaev <mr dot felixoid on gmail>

_name=boto3-stubs
pkgname=python-${_name}
pkgver=1.26.16
pkgrel=1
pkgdesc='Type annotations and code completion for botocore package'
arch=('any')
url="https://pypi.org/project/botocore-stubs"
makedepends=('python-setuptools')
depends=('python' 'python-boto3' 'python-botocore-stubs')
license=('MIT')
source=("https://files.pythonhosted.org/packages/c0/fb/3a8f6eff97fc6ddbacbf2e01a76c513e8a56acf0bc7d31484feef068effa/${_name}-${pkgver}.tar.gz")
sha256sums=(618253ae19f1480785759bcaee8c8b10ed3fc037027247c26a3461a50f58406d)

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"
}
