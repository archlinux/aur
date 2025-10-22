# Maintainer: omarplayz <omarplayzsounds@gmail.com>
pkgname=deta-surf
pkgver=1.1.0_beta.1.x86
pkgdesc="Deta Surf, an AI notebook that brings all your files and the web directly into your stream of thought."
pkgrel=1
arch=('x86_64')
source="git+https://github.com/deta/surf"
url="https://deta.surf"
license=('Apache-2.0')
depends=(glibc)
source=('deta-surf-1.1.0_beta.1.x86.AppImage::https://assets.deta.surf/releases/256375311/linux-x64/download')
sha256sums=('c7ae8f53f916bf00a52fbff159f2b7b74d77172a7457455060e69e4d44b9f8d5')

package() {
    mkdir -p "$pkgdir/usr/bin"
    mv "$srcdir"/deta-surf-*.AppImage "$pkgdir/usr/bin/deta-surf"
    chmod +x "$pkgdir/usr/bin/deta-surf"
}


