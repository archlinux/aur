# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
maintainer=mh4ckwascut
pkgname_orig=gobuster
pkgname=gobuster-bin
pkgver=3.6.0
pkgrel=1
pkgdesc="A Directory/File, DNS and VHost busting tool"
arch=('x86_64')
url="https://github.com/OJ/gobuster"
provides=('gobuster')
license=('Apache')
conflicts=('gobuster' 'gobuster-git')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
dirname=${pkgname_orig}_Linux_x86_64
source_x86_64=(
	"${binname}.tar.gz::${url}/releases/download/v${pkgver}/${dirname}.tar.gz"
)
sha256sums_x86_64=(
	'871be404ce5f80c96b864586b3caa90f894598d1a8222ae316c19e5f70e04cfc'
)

package(){
	install -Dm755 "${pkgname_orig}" "$pkgdir/usr/bin/${pkgname_orig}"
}
