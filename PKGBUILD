# Maintainer: tronicdude <tronicdude@gmail.com>
_pkgname=CRT-Amber-GRUB-Theme-4k
pkgname=grub2-theme-crt-amber-4k-git
pkgver=1
pkgrel=1
pkgdesc="Retro Amber CRT Terminal styled GRUB Theme 4k upscale"
url="https://github.com/aidan-gibson/CRT-Amber-GRUB-Theme-4k"
arch=('any')
license=('MIT')
depends=('grub' 'ncurses')
makedepends=('git')
source=(git+$url.git)
sha256sums=('SKIP')
install=grub2-theme-crt-amber-4k-git.install
# package() {
#   cd "${srcdir}/${_pkgname}"
#   # install -Dm 644 "$pkgdir"/boot/grub/themes/CRT-Amber-GRUB-Theme-4k
#   # install -Dm644 theme/* "$pkgdir"/boot/grub/themes/CRT-Amber-GRUB-Theme-4k/
#   # install -Dm 644 '{}' "${pkgdir}/usr/share/grub/themes/{}" \;
#   # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
#   install -d "$pkgdir"/boot/grub/themes/${_pkgname}
#   cp -rf ${srcdir}/${_pkgname}/theme/ ${pkgdir}/boot/grub/themes/${_pkgname}
# }

package() {
  cd "$srcdir/${_pkgname}"
  install -d "$pkgdir/boot/grub/themes/${_pkgname}"
  cp -r ./* "$pkgdir/boot/grub/themes/${_pkgname}/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  
}