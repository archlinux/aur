# Maintainer:levinit <levinit at outlook dot com>  https://github.com/levinit/aur-pkgbuilds
# Maintainer: ValHue <vhuelamo at gmail dot com> https://github.com/ValHue/AUR-PKGBUILDs
# Ex-Maintainer: end222 <pabloorduna98 at gmail dot com>

pkgname="nautilus-megasync"
pkgver="3.6.6"
pkgrel="2"
pkgdesc="Upload your files to your Mega account from nautilus."
arch=('i686' 'x86_64')
url="https://mega.co.nz/#sync"
license=('custom:The Clarified Artistic License')
depends=('libnautilus-extension' 'megasync>=2.9.8')
provides=("${pkgname}")

source=("https://mega.nz/linux/MEGAsync/Arch_Extra/x86_64/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")

sha256sums=('SKIP')

install="${pkgname}.install"

package() {
    cp -r usr $pkgdir/
}

# vim:set ts=4 sw=2 ft=sh et: