# Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=nerd-fonts-fantasque-sans-mono
pkgver=2.2.2
pkgrel=1
pkgdesc="Patched font FantasqueSansMono from the nerd-fonts library"
arch=("any")
url="https://github.com/ryanoasis/nerd-fonts"
license=('MIT')
depends=('fontconfig')
provides=('nerd-fonts-fantasque-sans-mono' 'ttf-font-nerd')
conflicts=('nerd-fonts-git' 'nerd-fonts-complete')
groups=("nerd-fonts")
source=("${url}/releases/download/v$pkgver/FantasqueSansMono.zip")

sha1sums=('4d353013b61eaeef399cc5413a1e2f640c0ac0d4')

package() {
  find . -iname "*.ttf" -not -iname "*Windows Compatible.ttf" \
        -execdir install -Dm644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}

