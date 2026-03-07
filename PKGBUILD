# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws-patch
pkgver=20260307
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
sha256sums=('fdb2acacb13ae71faab3c4e1649430c6a58ea5d4adb798027e1a63702a704b07'
            '53d63424fa4095cd6d4564753ff12414e98e419adad8c5885c1137787708b262'
            'cb681840c8c5549209edb6bef87665ef37ea20cf1643333842346b9cfb0e86f1'
            '389cf495edbd381feb287105722915f9ab4e6149e9054617fd6e08bd7e409f18'
            '0b44430bb1af54bc4bc92deb56cf56a8041f71f4ebc76344c6d6c9ca69888570'
            '1ba6b7796b76987fe6d64fd16ffd92aa2f3fa298705947cdeb29b2ca15582e19'
            '7bc04fac71f0949a584e4e27fc49048a657fe19ba851daed565b877689a6ecc1'
            'cce20a1849fbca1d9d70207199f5ee59d93f76c296da1991ae6e4b89896ae9aa'
            'b13ad41f4d4d7f17a4100297aeec6a70290e6eec9ee878392e86ea8097e553ac'
            '7a3203621399e9a3ea2a458a3eaca0156aacb4dcc071912573d36eb4e8202118'
            '50c4f3addf22e5bfe9d7f61d28f3ba143a352bee56f4332392d043d3b947298f'
            '0a7179cc91d8f29203eb18b6862b0c4d4da84de6ab842ac41c9c56c8249420b9'
            '4dfd9d0df78cb57fafd9fca31153f7851cb6bf7e27ca0bd6a40505fbe8b481da'
            'a8468327dbb25e07d8985f846801166a72dd7fe4ff6753614861682834edecc7'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
