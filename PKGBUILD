# Maintainer: Amanoel Dawod <amanoel at outlook dot com>
# Contributor: Santiago Torres-Arias <santiago@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aleksandar Trifunović <akstrfn at gmail dot com>
# Contributor: Matt Spaulding <matt at mattops dot io>
# Contributor: pyjano <pyjano at protonmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-ibm-plex
pkgver=1.3.1
pkgrel=1
pkgdesc="IBM Plex font family"
arch=('any')
url="https://github.com/IBM/plex"
license=('custom:OFL')
source=("$pkgname-$pkgver.zip::$url/releases/download/v$pkgver/TrueType.zip")
sha256sums=('428d64e8e03fa8326ed79d6ea72e7b1c9e816181c846c7d07fd21ee55aec4011')

package() {
    cd TrueType
    install -Dm644 */*.ttf -t "${pkgdir}/usr/share/fonts/TTF"

    # All the other licenses are the same as the one here...
    install -Dm644 IBM-Plex-Mono/license.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
