# Maintainer: Rodolfo Panerai <rodolfo.panerai at gmail dot com>
pkgname=megasync-bin
pkgver=4.11.0
pkgrel=3
pkgdesc="Easy automated syncing between your computers and your MEGA cloud drive"
arch=('x86_64')
url="https://mega.nz/#sync"
license=('custom')
provides=("megasync=$pkgver")
conflicts=('megasync'
           'megatools')
depends=('glibc>=2.33'
         'gcc-libs>=10.2.0'
         'qt5-base>=5.15'
         'qt5-tools>=5.15'
         'icu>=69.1'
         'sqlite'
         'openssl>=3.0.0'
         'zlib'
         'qt5-svg>=5.15'
         'qt5-x11extras'
         'bzip2'
         'xz'
         'libraw'
         'double-conversion>=3.1.5'
         'systemd'
         'freeimage')
optdepends=('sni-qt: fix systray issue on KDE and LXQt')
source=("https://mega.nz/linux/repo/Arch_Extra/x86_64/megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('01d481580c81a2c39192bde942d4a18c66a919b7a0ddd21350e03ec7b70f6f03')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
    # cp -R "${srcdir}/opt" "${pkgdir}/"
    rm -rf "${pkgdir}/usr/share/icons/ubuntu-mono-dark"
    rm -rf "${pkgdir}/usr/share/doc"
}
