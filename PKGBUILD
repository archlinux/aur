# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: whriedplanck
# Contributor: HRKo <hrko[at]r-c.dev>

pkgname=fcitx5-skin-microsoft_style
pkgver=0.1
pkgrel=1
pkgdesc="A ssf to fcitx5 skin ,made by ssfconv."
arch=('any')
url="https://github.com/zzy-ac/fcitx5-skin-microsoft-style"
license=('Apache')
depends=('fcitx5')
source=("$url/raw/main/Microsoft-style.tar.gz")
md5sums=('c61c92766ced53482d91b301c7347f7c')

package() {
    _variant_name=Microsoft-style
    cd ${srcdir}
    cd $_variant_name
    
    install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/$_variant_name
    install -m644 ./* "$pkgdir"/usr/share/fcitx5/themes/$_variant_name
}
