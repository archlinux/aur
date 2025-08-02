# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=soundy-bin
pkgver=0.4.1
pkgrel=2
pkgdesc='Simple GTK client to control your Bose SoundTouch speaker (binary release)'
url="https://github.com/syfds/soundy"
arch=('x86_64')
license=('GPL3')
depends=('avahi' 'granite' 'libsoup' 'libxml2-legacy')
source=("$url/releases/download/$pkgver/com.github.syfds.soundy_${pkgver}_amd64.deb")
sha256sums=('de9480f69565693651b98e2abd811c4a49d881c0df45f36c548ea13b4a0812a0')

package() {
  tar -xf data.tar.xz -C "$pkgdir"
  ln -s com.github.syfds.soundy "$pkgdir/usr/bin/soundy"
}
