# Maintainer: Arun Bahl <pitastrudl@archlinux.com>
pkgname=arch-fosdem-strudel
pkgver=2024
pkgrel=1
pkgdesc="Install a strudel wallpaper from the FOSDEM 2024"
arch=('any')
url="https://pitastrudl.me/arch-fosdem-strudel.jpg"
license=('MIT') 
noextract=("${pkgname}-${pkgver}") # No extraction needed; we're just downloading
source=("${url}")
sha256sums=('57d6964112a6cdc2c51bf8fc87cc70a47b772f3180b51951875b49211aba5214')

package() {
  install -vDm644 "${pkgname}.jpg" -t "$pkgdir/usr/share/backgrounds/${pkgname}/"
}

