# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.3.0
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('ed0664ca17619f1093bd4e923d8dfb1a1118fc235555dce72623078e9ce37015dd812145f02701fb6d63ea51574c21c462975ff5f54630268f314c7bab6df90a')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

