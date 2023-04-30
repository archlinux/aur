# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.0.0
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('b398b6c68e1c08e07d1be324f369af6c9e5d314a15caa1f0a931a7b2a6bc71326cb6b9085656cf05b89a8d1bdb15c6cf49ed7c3a6a965368a87fde5b2aa65b0f')


package() {
  install -dm 755 "$pkgdir/usr/bin/"

  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}

