# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=bashcities
pkgver=0.9
pkgrel=1
pkgdesc="A Neocities client written in Bash."
arch=(any)
url="https://github.com/tatsumoto-ren/bashcities"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'curl' 'git' 'bash')
sha256sums=('a3a0978550eeb5825817c91c79ae175e21407a69f1362f46bf51cee0a3cfa197')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
