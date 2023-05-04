# Maintainer: suienzan <suienzan at gmail dot com>

pkgname=mplus-1-code-nerd-font
pkgdesc='M PLUS 1 Code Nerd Font'
pkgver=3.0.0
pkgrel=1
epoch=1
arch=('any')
license=('OFL')
url='https://www.nerdfonts.com/'

source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver//_/-}/MPlus.zip")
sha256sums=('b59ba3c6ca1b2231c2dc96103c6a5f737a1210893288dbe5ea28f64ad0a642a3')
provides=("mplus-1-code")

package() {
  install -dm555 ${pkgdir}/usr/share/fonts/${pkgname}
  install -m444 M+1CodeNerdFont-*.ttf ${pkgdir}/usr/share/fonts/${pkgname}
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
