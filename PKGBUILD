# Maintainer: Emanuele 'Lele aka eldios' Calo' <xeldiosx@gmail.com>

pkgname=zulip-electron-bin
pkgver=0.5.10
pkgrel=2
pkgdesc="Desktop client for Zulip. Available for Mac, Linux and Windows."
arch=('x86_64')
url="https://github.com/zulip/zulip-electron"
license=('Apache')
depends=('electron')
source=("https://github.com/zulip/zulip-electron/releases/download/v${pkgver}/zulip-${pkgver}-x86_64.AppImage")
sha256sums=('ef718c8fa63052ddec598395e792afe9687513300641c778f68a869ed87df4ed')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 zulip-${pkgver}-x86_64.AppImage "$pkgdir/usr/bin/zulip-electron" 
    # no man pages, docs or web assets in release tarball
}
