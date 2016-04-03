# Maintainer: pzl <alsoelp@gmail.com>
# Contributor: Pritam Baral <pritam@pritambaral.com>

pkgname=ttf-fantasque-sans
pkgver=1.7.1
pkgrel=1
pkgdesc="A font family with a great monospaced variant for programmers."
arch=('any')
url="https://github.com/belluzj/fantasque-sans"
license=('SIL OPEN FONT LICENSE Version 1.1')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://github.com/belluzj/fantasque-sans/releases/download/v$pkgver/FantasqueSansMono.zip")
md5sums=('b0cbb25e73a9f8354e96d89524f613e7')

package() {
    install -d "${pkgdir}/usr/share/fonts/TTF"
    cp -dpr --no-preserve=ownership "${srcdir}/"*.ttf "${pkgdir}/usr/share/fonts/TTF"
}
