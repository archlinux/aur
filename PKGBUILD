# Maintainer: aquaticcalf <aquaticcalf@proton.me>
pkgname=spirit
pkgver=0.0.0
pkgrel=1
pkgdesc="spirit (prebuilt AppImage)"
arch=('x86_64')
url="https://github.com/aquaticcalf/spirit"
license=('MIT')
depends=('fuse2')
source=("spirit-0.0.0-x64.AppImage::https://github.com/aquaticcalf/spirit/releases/download/0.0.0/spirit-0.0.0-x64.AppImage")
sha256sums=('sha256:0bbb47aa4adf3fe9a91ab9be53318be210af876ac251a2dd8e6297fd5ed5488c')

package() {
  install -Dm755 "${srcdir}/spirit-0.0.0-x64.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
  install -d "${pkgdir}/usr/bin"
  ln -sf "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
