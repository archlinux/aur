# shellcheck shell=bash
# shellcheck disable=SC2034
# Maintainer: Chinmay Dalal <~chinmay/public-inbox@lists.sr.ht>

declare srcdir pkgdir
pkgname=ttf-ioskeley-mono
_pkgver=2025.10.09-6
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc=" Iosevka configuration to mimic the look and feel of Berkeley Mono as closely as possible"
arch=(any)
url="https://github.com/ahatem/IoskeleyMono"
license=('GPL')
options=(!strip)
source=("$pkgname-$pkgver.zip::${url}/releases/download/${_pkgver}/IoskeleyMono-TTF-Hinted.zip"
    "LICENSE::https://raw.githubusercontent.com/ahatem/IoskeleyMono/refs/tags/${_pkgver}/LICENSE")
md5sums=('3739109789a2a926e066cfb171ef7c98'
    'e9a14cb5b1cec21c6577808443ed0c08')

package() {
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-Regular.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-ExtraBoldItalic.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-Italic.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-Light.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-Medium.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-SemiBold.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-MediumItalic.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-ExtraBold.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-BoldItalic.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-Bold.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-LightItalic.ttf'
    install -vDm644 -t "$pkgdir/usr/share/fonts/TTF" 'TTF/IoskeleyMono-SemiBoldItalic.ttf'
    install -vDm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}

# vim:set ts=4 sw=4 et:
