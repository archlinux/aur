# Maintainer: Geoffrey Huntley <ghuntley@ghuntley.com>

# DEPRECATED: This package has been replaced by ampcode
# Please install ampcode instead: pacman -S ampcode

pkgname=sourcegraph-amp
pkgver=deprecated
pkgrel=2
pkgdesc='[DEPRECATED] This package has been renamed to "ampcode". Please install "ampcode" instead.'
arch=('any')
url='https://ampcode.com'
license=('custom:proprietary')
depends=('ampcode')
provides=('amp')

package() {
    # This is a transitional package that depends on 'ampcode'
    # Users should migrate to using 'ampcode' directly
    echo 'This package is deprecated. Please install ampcode instead.' > "${pkgdir}/deprecated.txt"
    install -Dm644 "${pkgdir}/deprecated.txt" "${pkgdir}/usr/share/doc/sourcegraph-amp/README"
}
