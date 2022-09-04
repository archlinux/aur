# Maintainer: noobping <hello@noobping.dev>

pkgname=wofi-pass
pkgver=r23.15269b6
pkgrel=3
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/TinfoilSubmarine/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=(
    'wtype: type support'
    'pass-otp: OTP support')
source=(https://raw.githubusercontent.com/TinfoilSubmarine/wofi-pass/master/wofi-pass)
sha512sums=('455df69845808226628eb2664f551d3dbdd2315ea16913d390cf815f656f56c7c0a9ae5870d032348d868d27c99f1cba081d2b6a13bad1af02e52be49918015c')

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -m755 wofi-pass "$pkgdir"/usr/bin/wofi-pass
}
