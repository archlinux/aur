# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: whriedplanck
# Contributor: HRKo <hrko[at]r-c.dev>

pkgname=fcitx5-nord-pink
pkgver=0.1
_commit=1e7c7977695905a2bcb5baa61c9972e75b0709a0
pkgrel=1
pkgdesc="A pink Fcitx5 theme based on fcitx5-nord"
arch=('any')
url="https://github.com/xpe-online/fcitx5-nord-pink"
license=('MIT')
depends=('fcitx5')
source=("$url/archive/$_commit/v${pkgver}.tar.gz")
md5sums=('b04ba017ebe5ded7d3644c33b31a504b')

package() {
    _variant_name=fcitx5-nord-pink
    cd ${srcdir}
    cd $_variant_name-$_commit
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/$pkgname
    install -m644 Nord-Pink/* "$pkgdir"/usr/share/fcitx5/themes/$pkgname
}
md5sums=('aa8824bbcbaac50590a665492481e563')
