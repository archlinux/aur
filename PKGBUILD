# Maintainer: Daniel Greve <greve.daniel.l@gmail.com>

pkgname=ttf-roboto-hinted
pkgver=2.134
pkgrel=1
pkgdesc='Sans serif font designed for Android (hinted)'
arch=('any')
url='https://material.google.com/style/typography.html'
license=('Apache')
conflicts=('ttf-roboto' 'ttf-roboto-git' 'ttf-roboto-font')
depends=('fontconfig')
provides=('ttf-font')
install=ttf-roboto-hinted.install
source=("https://github.com/google/roboto/releases/download/v${pkgver}/roboto-hinted.zip")
md5sums=('1a1459f19f8ae78a607a7ee7fc143093')

package() {
  cd "${srcdir}/roboto-hinted"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF"
}
