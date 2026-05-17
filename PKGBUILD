# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Claude Sonnet 4.6.

pkgname=whitelist-bypass-creator-bin
pkgver=0.3.2
pkgrel=1
pkgdesc="WhitelistBypass Creator — bypass platform restrictions"
arch=('x86_64')
url="https://github.com/kulikov0/whitelist-bypass"
license=('MIT')
depends=('fuse2')
source=("WhitelistBypass.Creator-${pkgver}-x86_64.AppImage::https://github.com/kulikov0/whitelist-bypass/releases/download/v${pkgver}/WhitelistBypass.Creator-${pkgver}-x86_64.AppImage")
sha256sums=('e7eeef9a407fcf4acc84a32f8b757a0b52b0de53de470d7fc89bcdf73c5c2f1a')

package() {
    chmod +x "${srcdir}/WhitelistBypass.Creator-${pkgver}-x86_64.AppImage"
    install -Dm755 "${srcdir}/WhitelistBypass.Creator-${pkgver}-x86_64.AppImage" \
        "${pkgdir}/usr/bin/whitelist-bypass-creator"
}