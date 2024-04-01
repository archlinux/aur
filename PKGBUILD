# Maintainer: aliu <aaronliu0130 @gmail.com>
pkgname='ttf-monaspice-huhanme-nerd-font-bin'
pkgver=1.000_3.1.1
pkgrel=3
pkgdesc="GitHub's Monaspace, with the Humanist, Handwriting and Mechanical variants for the normal, italic (& bold italic), and bold variants, patched with nerd font glyphs on top"
arch=('any')
url='https://github.com/aaronliu0130/monaspice'
license=('OFL-1.1-RFN')
provides=('ttf-monaspice' 'ttf-font-nerd')
# remove the -2 when the next version comes out
source=("monaspice-${pkgver}-2.tar.gz::https://github.com/aaronliu0130/monaspice/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('96a05bc7882246c588d39a3ddbbcc52e8c4608ca82305cc67b5c9c56e49778af')

package() {
	cd "monaspice-${pkgver}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/monaspice"
	install -Dm644 MonaspiceHuHanMeNF* -t "${pkgdir}/usr/share/fonts/TTF"
}
