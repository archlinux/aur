# Maintainer: jinzhongjia <mail@nvimer.org>
_commit=5d4b77594b2fc488fbb8e2c3a5275b6e5a694e32

pkgname=fcitx5-themes-candlelight
pkgver=0.1.1.5d4b77
pkgrel=1
url='https://github.com/thep0y/fcitx5-themes-candlelight'
pkgdesc='fcitx5的简约风格皮肤——烛光'
arch=('any')
license=('MIT')
conflicts=()
provides=()
replaces=()
makedepends=('git')
source=("git+https://github.com/thep0y/fcitx5-themes-candlelight.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    echo "0.1.1.${_commit:0:6}"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
    cp -r spring summer autumn winter "$pkgdir"/usr/share/fcitx5/themes/
    cp -r green transparent-green "$pkgdir"/usr/share/fcitx5/themes/
    cp -r macOS-light macOS-dark "$pkgdir"/usr/share/fcitx5/themes/
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
