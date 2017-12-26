# Maintainer: Miguel Revilla <yo@miguelrevilla.com>

pkgname=texlive-newalg
pkgdesc="The package contains the definitions that are needed to typeset code algorithms in a pretty way"
pkgver=19950108
pkgrel=1
arch=('any')
license=('Unknown')
depends=('texlive-core')
url="https://ctan.org/tex-archive/macros/latex/contrib/newalg"
source=('http://mirrors.ctan.org/macros/latex/contrib/newalg/newalg.ins'
		'http://mirrors.ctan.org/macros/latex/contrib/newalg/newalg.dtx')
sha256sums=('31c2719519a5a1539a5eeda0d11770b7df548d73b7f89bf268d13c9cabcc49df'
            'ae7a43230d1fc37c530feb692f0365ac6b640f5b6ca4747ccc6e09cd9f9270b0')

build() {

	cd "${srcdir}"
	latex newalg.ins

}

package() {

	cd "${srcdir}"
	install -Dm644 newalg.sty "${pkgdir}/usr/share/texmf/tex/latex/newalg/newalg.sty"

}
