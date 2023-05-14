# Maintainer: suienzan <suienzan at gmail dot com>

pkgname=mplus-1-code-nerd-font
pkgdesc='M PLUS 1 Code Nerd Font'
pkgver=3.0.1
pkgrel=1
arch=('any')
license=('OFL')
url='https://www.nerdfonts.com/'

source=("https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver//_/-}/MPlus.zip")
sha256sums=('64fd460cb16b8277dff3f1c00c8035ea56cfdf564e66ccdeb6ec070ef121e1fa')
provides=("mplus-1-code")

package() {
  install -dm555 ${pkgdir}/usr/share/fonts/${pkgname}
  install -m444 M+1CodeNerdFont-*.ttf ${pkgdir}/usr/share/fonts/${pkgname}
  install -D -m644 OFL.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
