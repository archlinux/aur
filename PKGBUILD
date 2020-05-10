# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codespace
pkgver=1.1.2
pkgrel=1
pkgdesc="The code snippet manager you've been waiting for (Requires license key)"
arch=('x86_64')
url="https://codespace.app"
license=('custom')
depends=('gtk3'
		 'libxss'
		 'alsa-lib'
		 'nss'
		 'libcups'
		 'at-spi2-core')
source=("${pkgname}-${pkgver}.tar.gz::https://codespace.app/download/latest")
sha256sums=('a6933017968661b2a4a3bcaa11599651c62614ec62a4f39a579f7cee23595f2f')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Codespace/codespace "${pkgdir}/usr/bin"
}