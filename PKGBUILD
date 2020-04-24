# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=documize-community-bin
pkgver=3.7.0
pkgrel=1
pkgdesc="Modern Confluence alternative designed for internal & external docs, built with Golang + EmberJS"
arch=('x86_64')
url='https://www.documize.com'
license=('AGPL-3.0')
optdepends=('postgresql>=9.6'
			'mariadb>=10.3.0')
provides=("${pkgname%-bin}" 'documize')
source=("https://github.com/documize/community/releases/download/v${pkgver}/documize-community-linux-amd64")
sha256sums=('bf6b43db38fe17a6a2f31a37d721b6863b8252a03b9306fa736008dc018b5c4d')

package() {
  install -Dm755 "${srcdir}/"documize* \
   "${pkgdir}/usr/bin/documize"
}