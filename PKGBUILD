# Maintainer: zhullyb <zhullyb at outlook dot com>
pkgname=dolphin-megasync-bin
pkgver=3.6.6
pkgrel=2
pkgdesc="Extension for KDE based file managers to interact with Megasync"
arch=('x86_64')
url="http://mega.nz"
license=('custom')
provides=("dolphin-megasync=$pkgver")
conflicts=('dolphin-megasync' 'dolphin-megasync-git')
depends=('megasync>=3.5'
         'dolphin')
source=("${url}/linux/MEGAsync/Arch_Extra/x86_64/dolphin-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.xz")
md5sums=('882a2bb9f4bec41ae285ae2b353d730b')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
}
 
