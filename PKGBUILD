# Maintainer: mapleafgo <mapleafgo at 163 dot com>
pkgname=winc
pkgver=0.1.857
pkgrel=1
pkgdesc="A lighter, faster desktop code editor"
arch=('x86_64')
url="https://winc.si"
license=('Apache-2.0')
depends=('glibc>=2.39' 'libgcc' 'fontconfig' 'ttf-dejavu' 'libxkbcommon' 'libxkbcommon-x11' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr' 'wayland')
conflicts=(${pkgname})
provides=(${pkgname})
source_x86_64=(${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst::https://github.com/DEEIX-AI/Winc/releases/download/v${pkgver}/${pkgname}-${pkgver}-${pkgrel}-x86_64.pkg.tar.zst)

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/usr"
}

sha256sums_x86_64=('9aace59862d65c6ba675a936b0984e7f6897899e4e73264f505700060f5f07b9')
