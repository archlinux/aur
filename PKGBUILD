# Maintainer: Alexandre Filgueira <faidoc@gmail.com>

pkgname=antergos-wallpapers
pkgver=0.6
pkgrel=1
pkgdesc="The default wallpapers for Antergos"
arch=('any')
url="http://www.antergos.com"
license=('CCPL:by-nc-sa')
source=("http://repo.antergos.info/antergos/x86_64/${pkgname}-${pkgver}-${pkgrel}-${arch}.pkg.tar.xz")
sha256sums=('86cf1d4b9aa773f18ab76d5bfbf3741febac0a0b259411ebf79f919550a79ccb')

package() {
  cd "${srcdir}"
  install -d "${pkgdir}/usr/share/antergos/wallpapers"
  install -m644 /usr/share/antergos/wallpapers/*.jpg "${pkgdir}/usr/share/antergos/wallpapers/"
  install -m644 /usr/share/antergos/wallpapers/*.png "${pkgdir}/usr/share/antergos/wallpapers/"

  install -d "${pkgdir}/usr/share/gnome-background-properties"
  install -m644 /usr/share/gnome-background-properties/antergos-backgrounds-4-3.xml "${pkgdir}/usr/share/gnome-background-properties/"
}
