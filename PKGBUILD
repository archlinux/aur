# Maintainer: Jonathan Grotelüschen <tippfehlr@archlinux.org>

pkgname=ttf-genei-koburi
pkgver=20260612
pkgrel=1
pkgdesc='A free Japanese kanji font'
arch=('any')
url='https://fontmeme.com/fonts/genei-koburi-mincho-font/'
license=('OFL-1.1')
source=("genei-koburi-mincho.zip::https://www.freefontdownload.org/download-font/genei-koburi-mincho")
sha512sums=('f7c78fcd62737921c87da37be8254d664711281037b89b6a7ceef26a922806e9cfee0b157277ddc4147b2095dcaceb66457487ab2f6f7d5e5ce3df6c1d693a8b')

package() {
	install -Dm644 genei-koburi-mincho/genei-koburi-mincho.ttf -t "$pkgdir/usr/share/fonts/TTF/"
}
