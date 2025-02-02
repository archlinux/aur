# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.2.10
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('89ec422341e482fe3c3b7cc39a5c6bbabef0a8c187a51a397b03465c0d1cf9b7b080a996222606edf749ca6299fb6579b5632a8edd6bb81d1744acf357c4e0cd')


package() {
  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"
}

