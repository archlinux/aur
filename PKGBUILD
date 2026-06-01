# Maintainer: aloxaf <aloxafx@gmail.com>

pkgname=ugcli
pkgver=1.1.0.12
pkgrel=1
pkgdesc='CLI tool for UGOS Pro application developers'
arch=('x86_64')
url='https://developer.ugnas.com/doc/tools/ugcli.html'
license=('unknown')
source=("ugcli-v${pkgver}-linux-amd64::https://osswaf.ugnas.com/pro/ugcli/download/ugcli-v${pkgver}-linux-amd64")
sha256sums=('9724e08cf381aa4e28a5f8168c93d2aa512e9b753b0b95b7ddd4a94c348b87f3')
options=('!strip')

package() {
	install -Dm755 "${srcdir}/ugcli-v${pkgver}-linux-amd64" "${pkgdir}/usr/bin/ugcli"
}
