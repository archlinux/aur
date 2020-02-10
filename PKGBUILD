# Maintainer: Steven Seifried <gitlab@canox.net>
# Contributor: Steven Seifried <gitlab@canox.net>
pkgname=egistec-es603-udev
pkgver=1
pkgrel=1
pkgdesc="udev Rule for EgisTec ES603 USB Fingerprint-Reader"
url="https://github.com/StevenSeifried/udev-rules/raw/master/90-egistec-es603.rules"
license=("GPL3")
arch=('any')
source=("https://github.com/StevenSeifried/udev-rules/raw/master/90-egistec-es603.rules")
sha256sums=('9128b07f97b22dfb3eeabcdf5cf71af4ea4ac9a3807653c51ab28b38f0344626')
sha512sums=('00d58d7c044c95d9fcb2ba8259ab56ab72f13241218e3a0e2941b21d458e2834090fc757b3f722e26ee6824bf6eb9b4667436ee5183f5e9cd88bb8f5826a7348')
package() {
 install -Dm644 "$srcdir/90-egistec-es603.rules" "${pkgdir}/etc/udev/rules.d/90-egistec-es603.rules"
}
