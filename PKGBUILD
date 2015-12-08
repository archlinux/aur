# Maintainer: Ranieri Althoff <ranisalt+aur@gmail.com>

pkgname=heroku-client
pkgver=3.42.25
pkgrel=1
pkgdesc="Everything you need to get started using Heroku"
arch=('i686' 'x86_64')
url="https://toolbelt.heroku.com"
license=('MIT')
optdepends=('git')
install="${pkgname}.install"
conflicts=('heroku-client-standalone' 'heroku-toolbelt')
source=("https://s3.amazonaws.com/assets.heroku.com/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('0394fa11def849d3279969ab503eb6c32f0d81b11735376358d26ba1766ddb56')

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/usr/local"

  mv "${pkgname}" "${pkgdir}/usr/local/heroku"
}

# vim:set ts=2 sw=2 et:
