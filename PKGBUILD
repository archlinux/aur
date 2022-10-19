# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: whriedplanck
# Contributor: HRKo <hrko[at]r-c.dev>

pkgname=fcitx5-skin-microsoft-style-dark
pkgver=1
pkgrel=1
pkgdesc="A ssf to fcitx5 skin ,made by ssfconv."
arch=('any')
url="https://github.com/zzy-ac/fcitx5-skin-microsoft-style"
license=('Apache')
depends=('fcitx5')
source=("$url/raw/main/Microsoft-style-dark.tar.gz")


package() {
    _variant_name=Microsoft-style-dark
    cd ${srcdir}
    cd $_variant_name
    
    install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/$_variant_name
    install -m644 ./* "$pkgdir"/usr/share/fcitx5/themes/$_variant_name
}
sha256sums=('4f8a6d713ecba746157d04e45b897f8a536dee8e126a5063b0ddb6251ec6a0ba')
