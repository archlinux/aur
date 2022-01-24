# Maintainer: Ayatale <ayatale@qq.com>

pkgname=ttf-lxgwwenkai
pkgver=1.113
pkgrel=1
pkgdesc="一款基于 FONTWORKS 的 Klee One 的开源中文字体。"
arch=("any")
url="https://github.com/lxgw/LxgwWenKai"
source=("$url/releases/download/v$pkgver/LXGWWenKai-Bold.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKai-Light.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKai-Regular.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKaiMono-Bold.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKaiMono-Light.ttf"
        "$url/releases/download/v$pkgver/LXGWWenKaiMono-Regular.ttf")
sha256sums=('13a4a029cfa98ff2ed3aa25f3eff5d8a904903f0ba3c5775c8eb8a85e5ca47d4'
            '96f641da36da6a6f55bdc20b8d2ef7c960aab0ea050a4cbfbc9bf294ff17b09b'
            '975b83d03ab110735a8d42dabf260642fdeca981f5b77cca5fb60d8f0289e1ff'
            '6053b6fa683f78244071d3370e022fc180cc214ff2bbe55c0da04b37cd9bb02a'
            '837db795918b2aaead1752e8aeefeec658afd6e9202d9133f1d4b2e3d3d15673'
            'ae4bac1bc297e72ab9676576fa5d0ed689c4863c6e22d17b2e4deaf3fb351e4d')
license=("SIL")
provides=("$pkgname")

package() {
    install -d "$pkgdir/usr/share/fonts/lxgwwenkai"
    install -m644 *.ttf "$pkgdir/usr/share/fonts/lxgwwenkai"
}
