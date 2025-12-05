# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=maple-mono-nf-cn-unhinted
pkgver=7.9
pkgrel=1
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font icons for IDE and terminal, fine-grained customization options."
arch=('any')
url="https://github.com/subframe7536/maple-font"
license=('OFL 1.1')
source=("https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip")
sha256sums=('ab88522932cf4015dffeaef6dedc59a22a5fefecdcc6e583d9fcd997da5b7cac')

package() {
    install -d "$pkgdir/usr/share/fonts/maple-mono-nf-cn-unhinted"
    cp -r $srcdir/*.ttf $pkgdir/usr/share/fonts/maple-mono-nf-cn-unhinted/
}
