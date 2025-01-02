# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=bashcities
pkgver=1.1
pkgrel=1
pkgdesc="A Neocities client written in Bash."
arch=(any)
url="https://github.com/tatsumoto-ren/bashcities"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'curl' 'git' 'bash')
sha256sums=('749e867625fc4dc1f9d2143db586eac6ecd846e211d7f8be348e66018ea0bdbf')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
