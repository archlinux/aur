# Maintainer: Jonas Gierer <jgierer12@gmail.com>

pkgname=gnome-shell-extension-stealmyfocus
pkgver=2018_05_17
_pkgver_sha=2d163feaa0ab5efabba3a3daa14243216c1775a8
pkgrel=1
pkgdesc="Removes the annoying 'Window is ready' notification and focus window immediately."
_uuid="steal-my-focus@kagesenshi.org"
arch=(any)
url="https://github.com/tak0kada/gnome-shell-extension-stealmyfocus"
conflicts=(gnome-shell-extension-stealmyfocus-git)
source=("https://github.com/tak0kada/gnome-shell-extension-stealmyfocus/archive/${_pkgver_sha}.tar.gz")
sha256sums=('47eb7ada104b760e8240e17ad6590b4ee3dd963d5f382e5f263b3b373bfa9d9a')

package() {
  install -m644 $pkgname-$_pkgver_sha/*.{js,json} -Dt $pkgdir/usr/share/gnome-shell/extensions/$_uuid
}
