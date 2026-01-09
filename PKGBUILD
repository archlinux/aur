# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Previous Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
pkgver=2026.01.07.7aef122
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=(phanpy-dist-$pkgver.tar.gz::"https://github.com/cheeaun/phanpy/releases/download/${pkgver}/phanpy-dist.tar.gz")
noextract=(phanpy-dist-$pkgver.tar.gz)
sha256sums=('ae9dc24ddd7b6cddb8c3fa4b4f377b2e10ba43f8244530002416baa2c42d0b4f')

package() {
	install -d "${pkgdir}"/usr/share/webapps/phanpy/
	tar xf phanpy-dist-$pkgver.tar.gz --no-same-owner --directory "${pkgdir}"/usr/share/webapps/phanpy/
}
