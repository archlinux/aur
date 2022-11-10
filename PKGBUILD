# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=goi18n-bin
_pkgname="${pkgname%-bin}"
pkgver=2.2.1
pkgrel=1
pkgdesc='CLI tool that manages message files used by the i18n package'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url="https://github.com/nicksnyder/${_pkgname/go/go-}"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}"::"${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${_goos}-${_goarch}")
b2sums=('5f745dbe5c6bd89856b9fbc118978394bd7af6f8375650ae14a9451cf6fb69c1649959149c967f03a0643b060f91a0347151a751fbfb44f969068640744ffbdc')

package() {
	install -D --mode 755 "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
