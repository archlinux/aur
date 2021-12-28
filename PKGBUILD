# Maintainer: hamki <hamki.do2000@gmail.com>
# Contributor: Will Crosswhite <will dot R dot lastname gmail-com>
pkgname=nordic-darker-theme
pkgver=2.1.0
pkgrel=2
pkgdesc="Nordic is a Gtk3.20+ theme created using the awesome Nord color pallete."
arch=('any')
url="https://github.com/EliverLara/Nordic"
license=('GPL3')
source=("$pkgname-$pkgver.tar.xz::$url/releases/download/v$pkgver/Nordic-darker.tar.xz")
sha256sums=('2916b6657840022f4bfd3b49b549115da6c79f6a176b38cb3c581bddea44854d')

package() {
  cd Nordic-darker
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/Nordic-darker/LICENSE"
  find assets cinnamon gnome-shell gtk-* metacity-1 xfwm4 index.theme \
		-type f -exec install -Dm 644 '{}' "$pkgdir/usr/share/themes/Nordic-darker/{}" \;
}
