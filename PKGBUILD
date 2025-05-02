# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws-patch
pkgver=20250503
pkgrel=1
pkgdesc="noto-cjk-chws 的标点部分"
arch=("any")
url="https://github.com/tjw123hh/noto-cjk-chws-patch"
license=("OFL-1.1")
source=("${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Black.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Black.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Bold.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Bold.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-DemiLight.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-DemiLight.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Light.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Light.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Medium.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Medium.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Regular.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Regular.ttc"
        "${pkgname}-${pkgver}-NotoSansCJKChwsPatch-Thin.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Sans/OTC/NotoSansCJKChwsPatch-Thin.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-Black.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-Black.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-Bold.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-Bold.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-ExtraLight.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-ExtraLight.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-Light.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-Light.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-Medium.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-Medium.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-Regular.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-Regular.ttc"
        "${pkgname}-${pkgver}-NotoSerifCJKChwsPatch-SemiBold.ttc::https://github.com/tjw123hh/noto-cjk-chws-patch/raw/main/Serif/OTC/NotoSerifCJKChwsPatch-SemiBold.ttc"
        LICENSE)
package() {
  for file in ${pkgname}-${pkgver}-*.ttc; do
      new_filename=$(basename "$file" | sed "s/^${pkgname}-${pkgver}-//")
      install -Dm644 "$file" "$pkgdir"/usr/share/fonts/noto-cjk-patch/$new_filename
  done
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
sha256sums=('97ea4ce26eb81a6c23d6afd64a206007c5bbbc7e9e688b0219dfe60dea748609'
            'ce1aa12141fb0a72f701aeb45404b0bbb22aaeff6e62cebb40db1d5c5e9f5add'
            '9d8e92d994cd962f7179bd4edb850ee742edaec034794f9e25d6a88bfefdba6b'
            'ad4da8bc3735906a776f81b157ce5930ae4604801de2f78ef9c1dc08cb4fef63'
            '4dabf3e4632be993cb02204b033e0dd6177b91989d6d86b3801279e6a2f28963'
            'df6015b8e2548d40c313efb113e95396ccffaa0f6ff88f2f7d8c7eb1cadf8ed5'
            'b35a8af0e2b035361fb8e00d7567143259b70cd8f1455bf9c3d6ecf69d5881b5'
            'c341aecaceaf55d53719b0195ab47663969f42cce0e67a43a4bfc51482e243f7'
            'f5a5eea5595d031c77aa673fd82ac5c8a8674f4470d370ef91c77b4b07247bb3'
            '5bd9b6e33828ebe3efb5539603459769a40cfbfcd5525cc86cdf030388c461c7'
            'bda932d41ec1950b4e29d414167ca7dd42bbfbf1f039c57a0e93062cf0618f61'
            '56678490ff68cb9d8d61a51268de355624c0d5d3460b2d4d0674c0da8ee9a396'
            '9bab51d8ef9cdfe551b0c2ce62f5f12d08605e0d2df9617b2ff698ee0f13ca30'
            'eb83fbb431c6618c85f18b8858d8fe2cfba3f6009538164b33f65ad81ffacfc7'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
