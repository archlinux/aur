# Maintainer: Joel Pickett <mail at vyryls dot com>

_pkgname=librewolf-extension-vimiumc
pkgname=$_pkgname-bin
pkgver=1.99.997
pkgrel=1
pkgdesc='A keyboard shortcut browser extension for keyboard-based navigation and tab operations with an advanced omnibar'
url=https://addons.mozilla.org/en-US/firefox/addon/vimium-c
arch=('any')
license=('custom')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("vimium_c-$pkgver.xpi")
_number=4210117
source=("vimium-c@gdh1995.cn.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/vimium_c-$pkgver.xpi"
        "https://raw.githubusercontent.com/gdh1995/vimium-c/master/LICENSE.txt")
sha256sums=('20e9217ba3d9a7bd0ec3faa88ed7f872acc3f039d1bdeb997398341631617184'
            'SKIP')

package() {
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
  install -Dm644 vimium-c@gdh1995.cn.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/vimium-c@gdh1995.cn.xpi"
}
