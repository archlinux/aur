# Maintainer:levinit <levinit at outlook dot com>  https://github.com/levinit/aur-pkgbuilds
# Maintainer: ValHue <vhuelamo at gmail dot com> https://github.com/ValHue/AUR-PKGBUILDs
# Ex-Maintainer: end222 <pabloorduna98 at gmail dot com>

pkgname="nautilus-megasync"
pkgver="5.2.0"
pkgrel="1"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('x86_64')
url="https://mega.io/desktop#downloadapps"
license=('custom:The Clarified Artistic License')
# depends=('libnautilus-extension' 'megasync')
provides=("${pkgname}")

source=("https://mega.nz/linux/repo/Arch_Extra/x86_64/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")

sha256sums=('b9cf7f5356d1dda69011747cf07d0501cb7f1ddb0e1408f69f16f2f20cb0eb38')

install="${pkgname}.install"

package() {
    cp -r usr $pkgdir/
}

# vim:set ts=4 sw=2 ft=sh et:
