# Maintainer: ethermawe
pkgname=ymusic-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="Нативный клиент Яндекс Музыки на Rust и Qt Quick"
arch=('x86_64')
url="https://github.com/ethermawe/ymusic"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative' 'qt6-svg' 'hicolor-icon-theme')
optdepends=('xdg-utils: открытие страницы входа и папки загрузок')
provides=('ymusic')
conflicts=('ymusic' 'ymusic-git')
options=('!strip' '!debug')
source=("ymusic-${pkgver}-1-x86_64.pkg.tar.zst::https://github.com/ethermawe/ymusic/releases/download/v${pkgver}/ymusic-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('c436e4408287e6085da8072ea287e9736aafc16051b1e529c26236d6773b5e4a')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
