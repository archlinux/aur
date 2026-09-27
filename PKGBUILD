# Maintainer: RK <rk@rkevin.dev>

pkgname=reticulum-meshchatx-bin
pkgver=4.9.1
pkgrel=1
pkgdesc='All-in-one Reticulum client, fork of Reticulum MeshChat'
arch=('x86_64')
url="https://github.com/Quad4-Software/MeshChatX"
license=('0BSD')
source=("${url}/releases/download/v${pkgver}/ReticulumMeshChatX-v${pkgver}-linux-amd64.deb")
sha256sums=('25a13a39a7fa264b35a0ad2ac5e01691bbc4162e8e673b1afc8bd3dbdb645ca5')

package() {
    tar xf data.tar.xz
    mkdir -p "$pkgdir/opt/" "$pkgdir/usr/bin/"
    cp -ar 'opt/Reticulum MeshChatX/' "$pkgdir/opt/"
    cp -ar 'usr/share/' "$pkgdir/usr/"
    ln -s '/opt/Reticulum MeshChatX/reticulum-meshchatx' "$pkgdir/usr/bin/reticulum-meshchatx"
}
