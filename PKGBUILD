# Maintainer: zaps166 <spaz16 at wp dot pl>

pkgname=qdre-compositor-autostart
pkgver=1
pkgrel=1
pkgdesc='Autostart for QDRE Compositor'
arch=('x86_64')
url='https://gitlab.com/zaps166/qdre'
license=('MIT')
groups=('qdre')
depends=('qdre-compositor-git')
source=("qdre-compositor.desktop")
sha1sums=('c2287a74c0e97543db5353312090189b07d8c439')

package() {
    install -D -m 644 "${srcdir}/qdre-compositor.desktop" "${pkgdir}/etc/xdg/autostart/qdre-compositor.desktop"
}
