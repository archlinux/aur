# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nxshell-bin
_pkgname=nxshell
pkgver=1.9.0
pkgrel=1
pkgdesc="An easy to use new terminal."
arch=('x86_64')
url="https://nxshell.github.io/"
_githuburl="https://github.com/nxshell/nxshell"
license=('MIT')
options=(!strip)
conflicts=(nxshell-appimage)
depends=(at-spi2-core alsa-lib nodejs-lts-fermium gtk3 nss python)
source=("${_pkgname}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/NxShell-amd64-linux-${pkgver}-202211250327.deb")
sha512sums=('c37a0b9d4b0dbc7b02fff1d7ef6ebd35b79fb3d652c2f44da9829d78ec2a465b6b6f872df341ccd3dde626c6bb36c8f9ff663760f7c534e5229a23a0d863a5ed')
package() {
    bsdtar -xvf data.tar.xz -C "${pkgdir}"
}
