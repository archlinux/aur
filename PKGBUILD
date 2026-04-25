# Maintainer: Excinis <excinis at proton dot me>
# Contributor: jpberdejo <jpberdejo at gmail dot com>
# Contributor: zhullyb <zhullyb at outlook dot com>
pkgname=dolphin-megasync-bin
pkgver=6.2.0
pkgrel=1
pkgdesc="Extension for KDE based file managers to interact with Megasync"
arch=('x86_64')
url="https://mega.nz/"
license=('custom')
provides=("dolphin-megasync=$pkgver")
conflicts=('dolphin-megasync' 'dolphin-megasync-git')
depends=('megasync'
         'dolphin')
source=("${url}linux/repo/Arch_Extra/x86_64/dolphin-megasync-x86_64.pkg.tar.zst")
sha256sums=('08e2f3b831dada0704b542f040bb02d2df945ac3a4918802a66375d9c7a4cb6c')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
}
 
