# Maintainer: Sourcegraph <support@sourcegraph.com>

pkgbase=ampcode-com
pkgname=ampcode-com
pkgver=0.0.1754024802
pkgrel=2
pkgdesc="[DEPRECATED] This package has been renamed to 'ampcode'. Please install 'ampcode' instead."
arch=('any')
url="https://ampcode.com"
license=('custom:proprietary')
depends=('ampcode')
provides=('amp')
replaces=('sourcegraph-amp')

package() {
    # This is a transitional package that depends on 'ampcode'
    # Users should migrate to using 'ampcode' directly
    echo "This package is deprecated. Please use 'ampcode' instead." > "${pkgdir}/usr/share/doc/ampcode-com-deprecated.txt"
    install -Dm644 "${pkgdir}/usr/share/doc/ampcode-com-deprecated.txt" "${pkgdir}/usr/share/doc/ampcode-com/README"
}
