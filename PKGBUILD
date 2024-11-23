# Maintainer: Arun Bahl <pitastrudl@archlinux.com>
pkgname=arch-summit-strudel-2024
pkgver=2024
pkgrel=1
pkgdesc="Install a strudel wallpaper from the Arch Linux Summit 2024"
arch=('any')
url="https://pitastrudl.me/arch-summit-strudel-2024.jpg"
license=('MIT') 
noextract=("${pkgname}-${pkgver}") # No extraction needed; we're just downloading
source=("${url}")
sha256sums=('735ae58dae747e42482126881f827a0383e6b99684cc1db9cc8068226c60d463')

package() {
  install -vDm644 "${pkgname}.jpg" -t "$pkgdir/usr/share/backgrounds/${pkgname}/"
}

