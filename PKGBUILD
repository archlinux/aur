# Maintainer: Nguyen Hoang Ky <nhktmdzhg at gmail dot com>
pkgname=maple-mono-nf-cn-unhinted
pkgver=7.8
pkgrel=1
pkgdesc="Open source monospace font with round corner, ligatures and Nerd-Font icons for IDE and terminal, fine-grained customization options."
arch=('any')
url="https://github.com/subframe7536/maple-font"
license=('OFL 1.1')
source=("https://github.com/subframe7536/maple-font/releases/download/v$pkgver/MapleMono-NF-CN-unhinted.zip")
sha256sums=('c531c2f499480c42c6c085acabff19554c332a3c03d9af8471e32c422f23f23a')

package() {
    install -d "$pkgdir/usr/share/fonts/maple-mono-nf-cn-unhinted"
    cp -r $srcdir/*.ttf $pkgdir/usr/share/fonts/maple-mono-nf-cn-unhinted/
}
