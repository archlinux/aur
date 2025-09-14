# Maintainer: Thayne McCombs <astrothayne@gmail.com>

presetFile=89-archlinux.preset
pkgname=arch-systemd-presets
pkgver=0.0.1
pkgrel=1
pkgdesc="systemd presets that more closely match archlinux service policy"
arch=(any)
license=('GPL')
depends=(systemd)
install=
source=("$presetFile")


package() {
  install -D -m0644 "$presetFile" "$pkgdir"/usr/lib/systemd/system-preset/"$presetFile"
}
sha256sums=('c2665bd0b3c5b5cc68faa84e86021b33fb2ea6c9be0371eca65cd989d1588e7b')
