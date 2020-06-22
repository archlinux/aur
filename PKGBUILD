# Maintainer: Caleb Maclennan <caleb@alerque.com>

_font=colortube
pkgbase=$_font-font
pkgname=("otf-$_font")
pkgver=1.002
pkgrel=1
pkgdesc='Multicolor tubes and dots'
url="https://www.neogrey.com/portfolio/$_font-font"
arch=('any')
license=('CCPL')
source=("$_font-$pkgver.zip::https://www.dropbox.com/s/11ic2r96tar8lj2/colortube%20by%20neogrey%20creative.zip?dl=1")
sha256sums=('6e20e8b0e570918a36266d012eb920b2aa082b12db54a53714aa35b468096629')

package_otf-colortube() {
    install -Dm644 -t "$pkgdir/usr/share/fonts/OTF/" *.otf
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.rtf
}
