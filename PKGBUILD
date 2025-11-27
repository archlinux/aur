# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

# Previous Maintainer: Bjoern Franke <bjo+aur@schafweide.org>
pkgname=phanpy-bin
pkgver=2025.11.26.ac85274
pkgrel=1
pkgdesc="A minimalistic opinionated Mastodon web client"
arch=('any')
url="https://github.com/cheeaun/phanpy/"
license=('MIT')
provides=('phanpy')
conflicts=('phanpy')
source=(phanpy-dist-$pkgver.tar.gz::"https://github.com/cheeaun/phanpy/releases/download/${pkgver}/phanpy-dist.tar.gz")
noextract=(phanpy-dist-$pkgver.tar.gz)
sha256sums=('9dfbc101d4bbe16449b1909be819bc1ba44065e1f37a40c20fd361b6abb0d433')

package() {
	install -d "${pkgdir}"/usr/share/webapps/phanpy/
	tar xf phanpy-dist-$pkgver.tar.gz --no-same-owner --directory "${pkgdir}"/usr/share/webapps/phanpy/
}
