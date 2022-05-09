# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=1.0.2
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, and other features'
arch=('x86_64')
url="https://gitlab.com/a4to/lfp"
license=('MIT')
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript)
install="lfp.install"
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'd15046114cb61f2d9066f8bda60f2fc3a301ae9298640f4e50e6264b2260c894744099c8e43b2839152e16d924946b411f47d7fd81d5e95785699b857c010246'
  '7a134ffda115def3180c90912580ab448ae87885bb13c3b63a54b56132164477c9c65a7ab626db551bc3e95d2ec21e60b6a857e928a325695dd1fb328d31e043'
  )
md5sums=(
  'f4d85f2d39e0dc24bcbc24b5e739a98b'
  '7035e0d038b0ec7ae344c16215825396'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
  install -Dm755 usr/share/${pkgname}/* -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
