# Maintainer: Arun Bahl <pitastrudl@archlinux.com>
pkgname=arch-cccongress-strudel
pkgver=2023
pkgrel=1
pkgdesc="Install a strudel wallpaper from the 37c3 congress Arch User Meetup"
arch=('any')
url="https://pitastrudl.me/arch-cccongress-strudel.jpg"
license=('CC-BY-SA-4.0') 
noextract=("${pkgname}-${pkgver}") # No extraction needed; we're just downloading
source=("${url}")
sha256sums=('3bd1a12e9f03f9aec35ca3bc6cf8650029e3474ad491e2d81a153e4c8cc7b06d')

package() {
  install -vDm644 "${pkgname}.jpg" -t "$pkgdir/usr/share/backgrounds/${pkgname}/"
}

