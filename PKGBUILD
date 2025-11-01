# Maintainer: Arun Bahl <pitastrudl@archlinux.com>
pkgname=arch-summit-strudel-2025
pkgver=2025
pkgrel=1
pkgdesc="Install a strudel wallpaper from the Arch Linux Summit 2025"
arch=('any')
url="https://pitastrudl.me/arch-summit-strudel-2025.jpg"
license=('MIT') 
noextract=("${pkgname}-${pkgver}") # No extraction needed; we're just downloading
source=("${url}")
sha256sums=('981ac930b68583acdee79ce5d9192a067a7feff8cd130d1c0cdc7d031a3fbca6')

package() {
  install -vDm644 "${pkgname}.jpg" -t "$pkgdir/usr/share/backgrounds/${pkgname}/"
}

