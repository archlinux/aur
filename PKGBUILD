# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=extract-xiso-bin
pkgver=202609111233
_pkgver=build-$pkgver
pkgrel=1
pkgdesc="Xbox ISO Creation/Extraction utility (binary release)"
url="https://github.com/XboxDev/extract-xiso"
license=("BSD-4-Clause")
arch=('x86_64')
provides=("extract-xiso")
conflicts=("extract-xiso")
source=("extract-xiso-$pkgver.zip::$url/releases/download/$_pkgver/extract-xiso_Linux.zip")
sha256sums=('c4b9fbf86b57c74d07fb643522740ae82034d8280ccde24528752cd1cb0b798d')

package() {
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/extract-xiso/LICENSE"
  install -Dm755 extract-xiso -t "$pkgdir/usr/bin"
}
