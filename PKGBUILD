# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=codespace
pkgver=1.1.0
pkgrel=1
pkgdesc="The code snippet manager you've been waiting for (Requires license key)"
arch=('x86_64')
url="https://codespace.app"
license=('Proprietary')
depends=('gtk3'
		 'libxss'
		 'libnotify'
		 'xdg-utils'
		 'libappindicator-gtk3'
		 'libxtst'
		 'nss'
		 'at-spi2-core')
source=("$pkgname-$pkgver.tar.gz::https://codespace.app/download/latest")
sha256sums=('67026d77ef1acb8dc731eea0609d083a72c184780d0242db1df420e8280b9ee0')

package() {
  tar xvf "${srcdir}/data.tar.xz" -C "${pkgdir}"
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Codespace/codespace "${pkgdir}/usr/bin"
}