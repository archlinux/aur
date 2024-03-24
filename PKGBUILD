# Maintainer: aliu <aaronliu0130 @gmail.com>
pkgname='ttf-monaspice-huhanme-nerd-font-bin'
pkgver=1.000_3.1.1
pkgrel=1
pkgdesc="GitHub's Monaspace, with the Humanist, Handwriting and Mechanical variants for the normal, italic (& bold italic), and bold variants, patched with nerd font glyphs on top"
arch=('any')
url='https://github.com/aaronliu0130/monaspice'
license=('OFL-1.1-RFN')
provides=('ttf-monaspice')
source=("monaspice-${pkgver}.tar.gz::https://github.com/aaronliu0130/monaspice/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f1a1dd3ccca6294b5a1c12745d54d28e5c71336db4bd38e525862be1a1cba3e6')

package() {
	cd "monaspice-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/monaspice"
	install -Dm644 MonaspiceHuHanMeNF* -t "${pkgdir}/usr/share/fonts/TTF"
}
