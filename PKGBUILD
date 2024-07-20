# Maintainer: jinzhongjia <mail@nvimer.org>
_commit=013aecb0368af853b55e56fe67f890b8ca0d8859

pkgname=fcitx5-themes-candlelight
pkgver=013aec
pkgrel=1
url='https://github.com/thep0y/fcitx5-themes-candlelight'
pkgdesc='fcitx5的简约风格皮肤——烛光'
arch=('any')
license=('unknown')
conflicts=()
provides=()
replaces=()
makedepends=('git')
source=("git+https://github.com/thep0y/fcitx5-themes-candlelight.git#commit=${_commit}")
md5sums=('SKIP')

pkgver() {
    echo "${_commit:0:6}"
}

package() {
    cd "$srcdir/$pkgname"
    install -dm755 "$pkgdir"/usr/share/fcitx5/themes/
    cp -r spring summer autumn winter "$pkgdir"/usr/share/fcitx5/themes/
    cp -r green transparent-green "$pkgdir"/usr/share/fcitx5/themes/
    cp -r macOS-light macOS-dark "$pkgdir"/usr/share/fcitx5/themes/
}
