# Maintainer: Ludvig Holtze <ludvig dot holtze at protonmail dot com>

pkgname=ttf-vcr-osd-mono
pkgver=1.001
pkgrel=1
pkgdesc="A font that mimics the on-screen display of VCRs"
url="https://www.dafont.com/vcr-osd-mono.font"
license=('custom')
arch=('any')
source=('vcr_osd_mono.zip::https://dl.dafont.com/dl/?f=vcr_osd_mono')
sha256sums=('b1811c21bb32c89f0268fdbc267f86682a9bfbf0afc8755c9794d9b88062ee89')

package() {
	cd "$srcdir"
	install -d "$pkgdir/usr/share/fonts/TTF"
	install -m644 "VCR_OSD_MONO_1.001.ttf" "$pkgdir/usr/share/fonts/TTF/VCROSDMono.ttf"
}
