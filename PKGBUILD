# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Pritam Baral <pritam@pritambaral.com>

pkgname=ttf-fantasque-sans
pkgver=1.7.0
pkgrel=1
pkgdesc="A font family with a great monospaced variant for programmers."
arch=('any')
url="https://github.com/belluzj/fantasque-sans"
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono.zip")
md5sums=('c58037f7f3d1bc27e47055450f396329')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    cp -dpr --no-preserve=ownership "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
