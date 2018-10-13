# Maintainer: Antoni Kepinski <a[at]kepinski[dot]me>
pkgname=cash-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Convert 170 Currency Rates using your terminal!"
url="https://github.com/xxczaki/cash-cli/"
arch=('i686' 'x86_64')
license=('MIT')
makedepends=('nodejs')

package() {
	cd "${PKGMK_SOURCE_DIR}"

	npm install --global cash-cli
}
