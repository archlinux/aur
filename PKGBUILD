# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=4.6.1
pkgrel=2
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
arch=('x86_64')
url="https://mega.io"
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
         'double-conversion'
         'systemd'
         'freeimage')
optdepends=('sni-qt: fix systray issue on KDE and LXQt')
source=("${url}/linux/MEGAsync/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('6f58d5596fa5149d01742f20e768ea99ba06e742d1e87d496ec6e66d35640963')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
    rm -rf "${pkgdir}/usr/share/doc"
}
