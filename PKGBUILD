# Maintainer: jpberdejo <jpberdejo at gmail dot com>
# Contributor: zhullyb <zhullyb at outlook dot com>
pkgname=dolphin-megasync-bin
pkgver=5.3.0
pkgrel=1
pkgdesc="Extension for KDE based file managers to interact with Megasync"
arch=('x86_64')
url="https://mega.nz"
license=('custom')
provides=("dolphin-megasync=$pkgver")
conflicts=('dolphin-megasync' 'dolphin-megasync-git')
depends=('megasync>=5.0'
         'dolphin')
source=("${url}/linux/repo/Arch_Extra/x86_64/dolphin-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('e97ea3033d09d090492004eb6279aafc826b6c8d613d402915368fe616f58c8f')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
}
 
