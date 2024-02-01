# Maintainer: Eduard Tolosa <edu4rdshl@protonmail.com>

pkgname=weakauras-companion-bin
pkgver=5.2.3
pkgrel=1
pkgdesc='A cross-platform application built to provide the missing link between Wago.io and World of Warcraft.'
url='https://github.com/WeakAuras/WeakAuras-Companion'
license=("GPL2")
arch=("x86_64")
depends=('libxshmfence' 'nss' 'at-spi2-atk' 'atk' 'libdrm' 'gdk-pixbuf2' 'gtk3')
source=("https://github.com/WeakAuras/WeakAuras-Companion/releases/download/v$pkgver/weakauras-companion_${pkgver}_amd64.deb")
sha512sums=('f05cd6541bfaa705a01e219d720e61b561c2db4e610a153c0a7a63cb0aa16f3fadb1041f6066eee04a52e060ce8a64dabacf4fb47ceffac177b19940510dd144')


package() {
  install -dm 755 "$pkgdir/usr/bin/"

  # Extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  ln -sf "/opt/WeakAuras Companion/weakauras-companion" "${pkgdir}/usr/bin/weakauras-companion"
}

