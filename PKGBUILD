# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=4.8.1
pkgrel=1
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
source=("${url}/linux/repo/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('62a82888fc78fa972b9e070b577bd2bf2190c6c87ea17a2befed74f51805dd74')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    # cp -R "${srcdir}/opt" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
    rm -rf "${pkgdir}/usr/share/doc"
}
