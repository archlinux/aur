# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=4.9.0
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
source=("https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('1f6961004b8953ca063aae27437064f665bc87eabd6933900669334ea2616005')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    # cp -R "${srcdir}/opt" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
    rm -rf "${pkgdir}/usr/share/doc"
}
