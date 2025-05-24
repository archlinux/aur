# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=extract-xiso-bin
pkgver=202505152050
_pkgver=build-$pkgver
pkgrel=1
pkgdesc="Xbox ISO Creation/Extraction utility (binary release)"
url="https://github.com/XboxDev/extract-xiso"
license=("BSD-4-Clause")
arch=('x86_64')
provides=("extract-xiso")
conflicts=("extract-xiso")
source=("extract-xiso-$pkgver.zip::$url/releases/download/$_pkgver/extract-xiso_Linux.zip")
sha256sums=('982bbfefc9255d51f5348a477d7135d68abf81c0af9600e5728edb1246cfa200')

package() {
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/extract-xiso/LICENSE"
  install -Dm755 extract-xiso -t "$pkgdir/usr/bin"
}
