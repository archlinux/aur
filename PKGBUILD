# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=documize-community-bin
pkgver=3.8.0
pkgrel=1
pkgdesc="Modern Confluence alternative designed for internal & external docs, built with Golang + EmberJS"
arch=('x86_64')
url='https://www.documize.com'
license=('AGPL3')
optdepends=('postgresql>=9.6'
      'mariadb>=10.3.0')
provides=("${pkgname%-bin}" 'documize')
source=("${pkgname}-${pkgver}::https://github.com/documize/community/releases/download/v${pkgver}/documize-community-linux-amd64")
sha256sums=('bdfd89748b398d0273c4fda6bff46e5f7f39e28c1a227a3f31c69f4d44b34c23')

package() {
  install -Dm755 "${srcdir}/"documize* \
   "${pkgdir}/usr/bin/documize"
}