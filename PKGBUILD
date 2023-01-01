# Maintainer: Vojtech Kral ❬vojtech%kral.pm❭

pkgname=bard-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Creates PDF and HTML songbooks out of easy-to-write Markdown sources. Binary package."
arch=('x86_64')
url="https://github.com/vojtechkral/bard"
license=('Apache-2.0')
depends=()
optdepends=('texlive-bin: TeX engine (generate PDFs) '
            'tectonic: Alternative TeX engine (generate PDFs) ')
source=("https://github.com/vojtechkral/bard/releases/download/v${pkgver}/bard")
sha256sums=('ef418578e37e6255ad2d5a4fdb84f119923cf91ebd808d3a321ec235f61d581f')

package() {
	install -Dm 755 bard -t "${pkgdir}/usr/bin/"
}
