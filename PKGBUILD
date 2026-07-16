# Maintainer: Masoud Yousefvand <yousefvand@gmail.com>

pkgname=burning-windows
pkgver=0.1.1
pkgrel=1
pkgdesc='Bottom-to-top burning close animation for KDE Plasma 6 KWin'
arch=('any')
url='https://github.com/yousefvand/Burning-Windows'
license=('MIT')

depends=('kwin>=6.0')
makedepends=('git')

_commit='cd13f04fbb590e7430a4025521e5ef9f894591f4'
source=("${pkgname}::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"

    install -d "$pkgdir/usr/share/kwin/effects/kwin4_effect_burning_windows"
    cp -a package/. "$pkgdir/usr/share/kwin/effects/kwin4_effect_burning_windows/"
}
