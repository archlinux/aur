# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=bashcities
pkgver=0.5
pkgrel=1
pkgdesc="A Neocities client written in Bash."
arch=(any)
url="https://github.com/tatsumoto-ren/bashcities"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'curl' 'git' 'bash')
sha256sums=('0760d47191b4b76476913c3f9b4976619eb7d4916090ea5198f860b94a84f721')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
