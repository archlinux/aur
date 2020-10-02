# Maintainer: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=fcitx5-skin-arc
_pkgname=fcitx5-arc-theme
pkgver=0.0.0.20201002
_commit=e759f97590e02f307e402bdba68849f943558218
pkgrel=1
pkgdesc="A fcitx5 theme imitates the famous Arc theme"
arch=('any')
url="https://github.com/Kienyew/fcitx5-arc-theme"
license=('MIT')
source=("https://github.com/Kienyew/fcitx5-arc-theme/archive/$_commit/$_pkgname-$_commit.tar.gz")
md5sums=('f9e3f4ac9ea621dafbbae3ff16a9aada')

package() {
    cd $_pkgname-$_commit
    find 'Arc' -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fcitx5/themes/{}" \;
    find 'Arc-Dark' -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fcitx5/themes/{}" \;

    # install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

