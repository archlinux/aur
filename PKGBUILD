# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=4.4.0
pkgrel=1
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
arch=('x86_64')
url="https://mega.nz"
license=('custom')
provides=("megasync=$pkgver")
conflicts=('megasync')
depends=('glibc'
         'gcc-libs'
         'qt5-base'
         'qt5-tools'
         'icu'
         'sqlite'
         'openssl'
         'zlib'
         'qt5-svg'
         'qt5-x11extras'
         'bzip2'
         'xz'
         'libraw'
         'double-conversion')
optdepends=('sni-qt: fix systray issue on KDE and LXQt')
source=("${url}/linux/MEGAsync/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('df80baeec7c0b534fa8120dda6041a6ffe2a59b4d7281abf82be938334d93da7')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
}
