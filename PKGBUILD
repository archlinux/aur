# Maintainer: Vojtech Kral ❬vojtech%kral.pm❭

pkgname=bard-bin
pkgver=2.0.1
pkgrel=1
pkgdesc="Creates PDF and HTML songbooks out of easy-to-write Markdown sources. Binary package."
arch=('x86_64')
url="https://github.com/vojtechkral/bard"
license=('Apache-2.0')
depends=()
optdepends=('texlive-bin: TeX engine (generate PDFs) '
            'tectonic: Alternative TeX engine (generate PDFs) ')
source=("https://github.com/vojtechkral/bard/releases/download/v${pkgver}/bard")
sha256sums=('98942ae973a100bb2bc41a973c7628a89f464b24c0de46f3a2967b2bbd650117')

package() {
	install -Dm 755 bard -t "${pkgdir}/usr/bin/"
}
