# Maintainer: Diego Miguel Lozano <hello@diegomiguel.me>

pkgname=python-casefy
pkgver=0.1.0
pkgrel=1
pkgdesc='Utilities to convert the case of strings'
arch=('any')
url='https://pypi.org/project/casefy'
license=('MIT')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/e0/a4/db0360fb2b7015401830398d9e77e2a252838f6307dc84c0205199f6f4cc/casefy-${pkgver}.tar.gz")
sha256sums=('a608be48e5eade0924a0f4c4c17135c4c26286430af45a55b136d70cfe21418e')

package() {
    cd "${srcdir}/casefy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
