# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

pkgname=bashcities
pkgver=0.4
pkgrel=1
pkgdesc="A Neocities client written in Bash."
arch=(any)
url="https://github.com/tatsumoto-ren/bashcities"
license=("GPL3")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python' 'curl' 'git' 'bash')
sha256sums=('2c990191de27683fe91f614830b93006b5e62915590fb50ee8e8cef98736e52b')

package() {
	cd -- "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
