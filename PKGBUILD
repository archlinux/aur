# Maintainer:  dreieck
# Contributor: capezotte <capezotte@artixlinux.org>
# Contributor: dreieck

# On 2026-09-24, taken from https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/ipp-usb/ipp-usb.initd

pkgname=ipp-usb-openrc
pkgver=20260924
pkgrel=1
pkgdesc="OpenRC ipp-usb init script"
arch=('any')
url="https://gitlab.alpinelinux.org/alpine/aports/-/blob/master/testing/ipp-usb/"
license=('GPL-2.0-only')
provides=('init-ipp-usb')
depends=('ipp-usb')
optdepends=('openrc: To make use of this init script.')
conflicts=('init-ipp-usb')
backup=('etc/conf.d/ipp-usb')
source=(ipp-usb.initd)
sha256sums=('106e551e94686d32c9bfde468d1c3262d3b4715a011b932182c9ed26402bcff3')

package() {
    install -Dm755 "$srcdir/ipp-usb.initd" "$pkgdir/etc/init.d/ipp-usb"
}
