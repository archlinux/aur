# Maintainer: Joseph R. Quinn <quinn period josephr at protonmail dot com>
pkgname=nerd-fonts-inconsolata
pkgver=2.0.0
pkgrel=1
pkgdesc=""
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=()
makedepends=('fontconfig')
provides=('nerd-fonts-inconsolata')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete' 'nerd-fonts-complete-mono-glyphs'
  'nerd-fonts-gabmus' 'nerd-fonts-ricty')
source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v$pkgver/Inconsolata.zip")
sha1sums=('5289f5069db1058fbdff0017b4098796e2042a11')

package() {
  find . -iname "*.otf" -not -iname "*Windows Compatible.otf" -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/OTF/{}" \;
}
