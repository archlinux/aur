# Maintainer: Charlie83 <dev at charlie83 dot com>

_pkgname=librewolf-extension-protonpass
pkgname=$_pkgname-bin
pkgver=1.33.2
pkgrel=1
pkgdesc='Free and unlimited password manager to keep your login credentials safe and manage them directly in your browser. (binary release)'
url="https://addons.mozilla.org/addon/proton-pass"
license=('GPL-3.0-only')
arch=('any')
depends=('librewolf')
conflicts=("$_pkgname")
provides=("$_pkgname")
groups=('librewolf-addons')
noextract=("proton_pass-$pkgver.xpi")
source=("https://addons.mozilla.org/firefox/downloads/file/4644816/proton_pass-$pkgver.xpi")
sha256sums=('98c8471383c187da7e157db4cf1f47033c058e65c9ed00d6ff3f876121ad5349')

package() {
  install -Dm644 proton_pass-$pkgver.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/78272b6fa58f4a1abaac99321d503a20@proton.me.xpi"
}

