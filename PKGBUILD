# Maintainer: Evgeniy "arcanis" Alexeev <arcanis at archlinux dot org>

pkgname=repo-scripts
pkgver=1.7.3
pkgrel=1
pkgdesc="A set of scripts to work with your repository"
arch=('any')
url="https://github.com/arcan1s/repo-scripts"
license=("GPLv3")
depends=('devtools' 'sudo' 'yaourt')
source=("https://github.com/arcan1s/repo-scripts/releases/download/V.${pkgver}/${pkgname}-${pkgver}-src.tar.xz")
md5sums=('f5056598cb96bf126f3dd49257faa4ba')
install="repo-scripts.install"
backup=('etc/repo-scripts.conf')

package() {
  "${srcdir}/${pkgname}/install.sh" "${pkgdir}"
}
