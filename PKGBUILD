# Maintainer: Hayate Nakamura <hayatehay.njb at gmail dot com>
pkgname=add-pacman-repository
pkgver=0.2.2
pkgrel=4
pkgdesc="Interactive shell script to help adding Pacman repositories."
arch=('any')
url="https://github.com/njb-fm/add-pacman-repository"
license=('BSD')
depends=('bash' 'wget')
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('75f3e850496c268f01121a777e2193e4')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  #install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
