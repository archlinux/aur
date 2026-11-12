# Maintainer: RK <rk@rkevin.dev>

pkgname=reticulum-meshchatx-bin
pkgver=4.11.0
pkgrel=1
pkgdesc='All-in-one Reticulum client, fork of Reticulum MeshChat'
arch=('x86_64')
url="https://github.com/Quad4-Software/MeshChatX"
license=('0BSD')
source=("${url}/releases/download/v${pkgver}/ReticulumMeshChatX-v${pkgver}-linux-amd64.deb")
sha256sums=('95984e81ab4454e10fa27230ade3268a14e12b77810b10da734ee82840aa01be')

package() {
    tar xf data.tar.xz
    mkdir -p "$pkgdir/opt/" "$pkgdir/usr/bin/"
    cp -ar 'opt/Reticulum MeshChatX/' "$pkgdir/opt/"
    cp -ar 'usr/share/' "$pkgdir/usr/"
    ln -s '/opt/Reticulum MeshChatX/reticulum-meshchatx' "$pkgdir/usr/bin/reticulum-meshchatx"
}
