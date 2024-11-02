# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=git-secrets
pkgver=1.3.0
pkgrel=2
pkgdesc="Prevents you from committing secrets and credentials into git repositories"
arch=('any')
url="https://github.com/awslabs/git-secrets"
license=('Apache')
depends=('awk' 'sed' 'coreutils')
source=(https://github.com/awslabs/${pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('f1d50c6c5c7564f460ff8d279081879914abe920415c2923934c1f1d1fac3606')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr/" install
}
