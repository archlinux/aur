# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws-patch
pkgver=20240730
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
sha256sums=('c937b7aa3017d8fd2de4ef207f64547a592306146cffe80497a8f0ebe992a84f'
            '8cd199c724ca0c05c8667fa2a60b4ca9b681f051baf44f02ce3c7391b602a254'
            '03f2916e047ff54d812e7d96738801b8be998b4d13c928e32707567fe3fb0aef'
            'a653ced0e8ee7c3d3bdb669e76775b5757d2ad56c296b136f7b64d6580c45ee0'
            'd138d105790b47baca456b170e665a466d1f3ef034373d212477c88ba6e3f48b'
            '12d5aa2795f413dd4180c3a038189ca66c73c9ea4c8b28951ada89eba30509c5'
            '2d7aa23a682ce9f3b864ebdfdc6f5354922187f96373afb0dfce0342ef6c0b1f'
            'bdaa7ca6b6ca27ec4ef59d74423405682a4db7e22bf9ef580cd91aee2c506578'
            '5b076aacee01913335c0989e61c0513abdf4aa69c2cbd2b300995ac5da7a620c'
            'eaa74988066f53c4c94d550d430e2486df3b5fce35785bdd2d0cc712ed34fc13'
            '277e56fea2fe489c40e6b3d5a38a3e3b3f69930f2c44d9171e24c35382b9e2df'
            '0d5c316728ffa59a3b2718e8a9ed8e95aebf84461ab88566ee5d48fbbf6304b0'
            '4de1dca654a11233ca0479618fe40f7f096106e4775ff85c033105022bb4eb01'
            'd8bfc80a83bfc7092179997911b678eaca6ef594dbb7f6400ba375942ca8777b'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
