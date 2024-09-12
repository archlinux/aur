# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.2.7
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('22fb23a1ee87096da0e4f43cfdb932191387c6ff27937f3f57d409d92a7cab3a9ab6a5f2cbc9b61ad661f4d7f5d9dbedb82c7ed929e7022cf4ad3cbe4e87a336')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

