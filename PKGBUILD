# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Previous Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
pkgver=2025.06.08.34eb5f8
pkgrel=2
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=(phanpy-dist-$pkgver.tar.gz::"https://github.com/cheeaun/phanpy/releases/download/${pkgver}/phanpy-dist.tar.gz")
noextract=(phanpy-dist-$pkgver.tar.gz)
sha256sums=('24a3b5352ce69b4df198077ae032a716539b411bf34f42f07ca1b57e82e80cc2')

package() {
	install -d "${pkgdir}"/usr/share/webapps/phanpy/
	tar xf phanpy-dist-$pkgver.tar.gz --no-same-owner --directory "${pkgdir}"/usr/share/webapps/phanpy/
}
