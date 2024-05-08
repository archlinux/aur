# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.2.4
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('d2be155ff43de766b11477e1d8352ef9a17c92d8b54868bd97d9a0c7b6845ba917da3193735fa60612c78805c7709f466da62d8a6e5f52f4f2b343b8c2b29bd8')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

