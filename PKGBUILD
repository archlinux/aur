# Maintainer: Evgeniy "arcanis" Alexeev <esalexeev@gmail.com>

pkgname=repo-scripts
pkgver=1.5.3
pkgrel=2
pkgdesc="A set of scripts to work with your repository"
arch=('any')
url="https://github.com/arcan1s/repo-scripts"
license=("GPLv3")
depends=('yaourt' 'devtools')
source=(https://github.com/arcan1s/repo-scripts/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.tar.xz)
md5sums=('124365b35311d209cbd2d8e7458ab1da')

backup=('etc/repo-scripts.conf')

package() {
  "${srcdir}/${pkgname}/install.sh" "${pkgdir}"
}
