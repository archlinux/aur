# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: pryme-svg <edoc.www@gmail.com>

pkgname=nerd-fonts-tinos
pkgver=2.3.0
pkgrel=1
pkgdesc="Patched font Tinos from Nerd Fonts Library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('Apache')
provides=('ttf-nerd-fonts-tinos')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/Tinos.zip")
sha256sums=('8cb947caff0eb80bda25b01aa235259c0f7dc8dba1f0bde695ca6c1e1e123186')

package() {
	find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}
