# Maintainer: jpberdejo <jpberdejo at gmail dot com>
# Contributor: zhullyb <zhullyb at outlook dot com>
pkgname=dolphin-megasync-bin
pkgver=5.4.0
pkgrel=2
pkgdesc="Extension for KDE based file managers to interact with Megasync"
arch=('x86_64')
url="https://mega.nz"
license=('custom')
provides=("dolphin-megasync=$pkgver")
conflicts=('dolphin-megasync' 'dolphin-megasync-git')
depends=('megasync>=5.9'
         'dolphin')
source=("${url}/linux/repo/Arch_Extra/x86_64/dolphin-megasync-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst")
sha256sums=('efeba7e31fe67fd67e36a09871748a7e1d15af7771c1199c7a0654f011f8f588')

package() {
    cp -R "${srcdir}/usr" "${pkgdir}/"
}
 
