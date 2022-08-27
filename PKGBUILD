# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pryme-svg <edoc.www@gmail.com>

pkgname=nerd-fonts-tinos
pkgver=2.2.1
pkgrel=1
pkgdesc="Patched font Tinos from Nerd Fonts Library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('Apache')
provides=('ttf-nerd-fonts-tinos')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Tinos.zip")
sha256sums=('35b0c771731d03c405ab2a7d2fe52f4f091d30af6752e20d3c749e9048475d4f')

package() {
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}
