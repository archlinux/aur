# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
maintainer=mh4ckwascut
pkgname_orig=gobuster
pkgname=gobuster-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="A Directory/File, DNS and VHost busting tool"
arch=('x86_64')
url="https://github.com/OJ/gobuster"
provides=('gobuster')
license=('Apache')
conflicts=('gobuster' 'gobuster-git')
binname=${pkgname_orig}-${pkgver}-${pkgrel}
dirname=${pkgname_orig}_${pkgver}_Linux_x86_64
source_x86_64=(
	"${binname}.tar.gz::${url}/releases/download/v${pkgver}/${dirname}.tar.gz"
)
sha256sums_x86_64=(
	'7c2e410580203f2e5ca1590f79083aaf551342193dfb39ff3e15a65ed889405a'
)

package(){
	install -Dm755 "${pkgname_orig}" "$pkgdir/usr/bin/${pkgname_orig}"
}
