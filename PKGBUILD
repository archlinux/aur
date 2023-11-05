# Maintainer: Arun Bahl <pitastrudl@archlinux.com>
pkgname=arch-summit-strudel
pkgver=2023
pkgrel=1
pkgdesc="Install a strudel wallpaper from the Arch Linux Summit 2023"
arch=('any')
url="https://pitastrudl.me/arch-summit-strudel.jpg"
license=('MIT') 
noextract=("${pkgname}-${pkgver}") # No extraction needed; we're just downloading
source=("${url}")
sha256sums=('9563d2a0682050e423051a7c511ec1016ef5d9ca18b17e9f754f0896378c63a2')

package() {
  install -vDm644 "${pkgname}.jpg" -t "$pkgdir/usr/share/backgrounds/${pkgname}/"
}

