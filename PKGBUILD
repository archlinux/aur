# Maintainer: Kienyew <aobi100bt@hotmail.com>

pkgname=fcitx5-skin-arc
_pkgname=fcitx5-arc-theme
pkgver=0.0.0.20201005
_commit=5d2a3981304499e81131730577cbf22f881d7919
pkgrel=1
pkgdesc="A fcitx5 theme imitates the famous Arc theme"
arch=('any')
url="https://github.com/Kienyew/fcitx5-arc-theme"
license=('MIT')
source=("https://github.com/Kienyew/fcitx5-arc-theme/archive/$_commit/$_pkgname-$_commit.tar.gz")
md5sums=('3e61fcd7379de96615d0601ac43b2aef')

package() {
    cd $_pkgname-$_commit
    find 'Arc' -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fcitx5/themes/{}" \;
    find 'Arc-Dark' -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fcitx5/themes/{}" \;

    # install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

