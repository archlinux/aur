# Maintainer: noobping <hello@noobping.dev>

pkgname=wofi-pass
pkgver=0.0.1
pkgrel=2
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/TinfoilSubmarine/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=(
    'wtype: type support'
    'pass-otp: OTP support')
source=(https://raw.githubusercontent.com/purplg/wofi-pass/master/wofi-pass)
sha512sums=('c47d7067dedc0038d75625ecd10a5b37560862cb4f6209b140951fb27dc2979245906dbbcd03e0fe9b35b1aafb3faf15d95b22a528df3a4143563aa302c3cc46')

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -m755 wofi-pass "$pkgdir"/usr/bin/wofi-pass
}
