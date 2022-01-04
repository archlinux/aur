# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: Will Crosswhite <will dot R dot lastname gmail-com>
pkgname=nordic-darker-standard-buttons-theme
pkgver=2.1.0
pkgrel=1
pkgdesc="Nordic is a Gtk3.20+ theme created using the awesome Nord color pallete."
arch=('any')
url="https://github.com/EliverLara/Nordic"
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker-standard-buttons.tar.xz")
sha256sums=('50a508bc8c505ee774bc5e1292f03f237e5d57c9fd3e4be2f0edd7f7bf6c6016')

package() {
  cd Nordic-darker-standard-buttons
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/Nordic-darker-standard-buttons/LICENSE"
  find assets cinnamon gnome-shell gtk-* metacity-1 xfwm4 index.theme \
          -type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/Nordic-darker-standard-buttons/{}" \;
}