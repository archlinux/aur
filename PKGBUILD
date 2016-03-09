# Maintainer: Yves Hoppe <info@yveshoppe.de>

pkgname=calypso
pkgver=1.3.0
pkgrel=1
pkgdesc="Manage your Wordpress.com and Jetpack-enabled sites in one place"
arch=(i686 x86_64)
url=https://desktop.wordpress.com/
license=(GPL2)
depends=()
conflicts=()
install=$pkgname.install

md5sums=('180894acdefbc80bc72fa85eba13abfd')

source=(https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?type=deb)

prepare() {
	tar -xf data.tar.gz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
