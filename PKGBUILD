# Maintainer:
# Contributor: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Matt Spaulding <matt at mattops dot io>
# Contributor: pyjano <pyjano at protonmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.3.0
pkgrel=1
pkgdesc="IBM Plex Mono, Sans, and Serif"
arch=('any')
url='https://github.com/IBM/plex'
license=(custom:OFL)
depends=(fontconfig xorg-font-utils)
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/TrueType.zip")
sha256sums=('fe4ff7bd12c3dbbe0d62f3380661e506f81c9bcb30bcf86ec044140b4c09f8a8')

package() {
    cd TrueType
    install -Dm644 */*.ttf -t "${pkgdir}/usr/share/fonts/TTF"

    # All the other licenses are the same as the one here...
    install -Dm644 IBM-Plex-Mono/license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
