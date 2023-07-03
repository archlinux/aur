# Maintainer: zhullyb <zhullyb at outlook dot com>
pkgname=dolphin-megasync-bin
pkgver=5.2.0
pkgrel=1
pkgdesc="Extension for KDE based file managers to interact with Megasync"
arch=('x86_64')
url="http://mega.nz"
license=('custom')
provides=("dolphin-megasync=$pkgver")
conflicts=('dolphin-megasync' 'dolphin-megasync-git')
depends=('megasync>=3.5'
         'dolphin')
source=("${url}/linux/repo/Arch_Extra/x86_64/dolphin-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e249aa2ab2baa83cc2ffc91f87c7c9e118e0f28528a53307aa966d7bc1a8a77d')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
}
 
