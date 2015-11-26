# Maintainer: Renato Garcia <fgarcia.renato@gmail.com>
# Contributor: Robson Roberto Souza Peixoto <robsonpeixoto@gmail.com>

pkgname=funcoeszz
pkgver=15.5
pkgrel=1
pkgdesc="Brazilian script with 134 useful mini applications"
arch=('any')
url="http://funcoeszz.net/"
license=('GPL')
depends=('bash' 'sed' 'grep' 'lynx' 'sox' 'bc' 'diffutils' 'coreutils' \
         'gawk' 'ncurses' 'gcc' 'findutils' 'procps' 'glibc')
source=(http://funcoeszz.net/download/${pkgname}-${pkgver}.sh)
md5sums=('25b8ef28e897c064af9f91a12b5f0eb2')

package() {
  cd "${srcdir}"
  install -D -m 755 "${pkgname}-${pkgver}.sh" "${pkgdir}/usr/bin/${pkgname}"
}
