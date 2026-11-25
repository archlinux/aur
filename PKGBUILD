# Maintainer: ethermawe
pkgname=ymusic-bin
pkgver=0.3.0
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
sha256sums=('f1c95281bd55ab7b5e172c113b7340fe09fa75413c9780f0d47265e535089bde')

package() {
    cp -a "$srcdir/usr" "$pkgdir/"
}
