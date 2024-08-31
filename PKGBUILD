# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.2.6
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('8301e82323de28f233f92a03f245c8a5c470b1f529447bcbfea7dd2b7fcac0d82a9f357e4d2f21a9f237dc11284225cac695352e119b5dd679a9119b273b406f')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

