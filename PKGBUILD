# Maintainer: Mike Javorski (javmorin) <mike.javorski gmail com>
pkgname=python-aws_lambda_builders
_name=${pkgname#python-}
pkgver=0.9.0
pkgrel=1
pkgdesc='Python library to compile, build & package AWS Lambda functions for several runtimes & framework'
arch=('any')
url="https://github.com/awslabs/aws-lambda-builders"
license=('Apache')
depends=('python-six')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('660028424c8ce4677debbec33f56e37498f71170da80cc91fa322d1b2071bb0a')

package() {
  cd "$srcdir/$_name-$pkgver"
  /usr/bin/python setup.py install --root="$pkgdir/" --optimize=1
}
