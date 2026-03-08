# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws-patch
pkgver=20260308
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
sha256sums=('b78f68910b282f14934d0316b207015ccd84e6d23e2e688519b3bbda56cd17ec'
            '53b4bb4f943728cb7ab341aec69469490bd794021e705bb74f8fc5a624c41c27'
            '422a61a9737048f8cdab93c82f040bb56ebb3c4bc07675ea6aec336a477f4fc9'
            'f09a0ba11141ff13000ac235b4fd1b06e415619bab58f3327989b272edf5330b'
            '0f96433bb852a4a511509b04f64d5779fa63eca1e056211c148450aa516da540'
            '4ef2e8b4967481bede126a7d44d06d165eb775e559271c5d559bda66ad4d2871'
            '177aa4df8e2198c8c539676e137cbd0362cfbd4f8303a819108a33cdacd5df6a'
            '57389d437ce9a496ee0711f6220c57202beac827e28a736905d64932c7287fb2'
            'dadea6dba939d07b6f43e3ecf3314a0e5ec7361507f8d00bb37efb1eeeab0b7f'
            'de3f1ebf01ff1fff4e9e7088cf524f5960b6bed98e2458ffe9eb0126666f3661'
            'e97e7312b66887bf2108b0bc0f20e29aff97e5345d35d85a94ca112a801a3641'
            '461f93c79e779929813b27536d9a4f272aca2e7f2b54e19fe5de9b7233210700'
            '74d1f4a0f4d1e654d1b23a2343a60ecc53184fceb58cb86b1e78873f004fc499'
            '6b3a2e1195f10acb32c0227c3fe997334038b69790ed25ee05f506793bf064a0'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
