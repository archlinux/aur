# Maintainer: Tjw123hh <tjw123hh@outlook.com>

pkgname=noto-fonts-cjk-chws-patch
pkgver=20240815
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
sha256sums=('3d48fa4ee88c947ce4d2ddbb9fab584affd6a42ad94476d73ae248672f1e9b42'
            '9747af4e291083b581dcd641914df4a5a8240ea04226250123ffb39a8234c278'
            '6bbbc7b66d8cf56d81ed7e7ecedba15e30db4ba8f3dd669ec4f6040e1b221a91'
            '34accde3a0a748927b4d70f2780ffbb7b2524de1585c881b7984657fe491d414'
            'fde9491afeec8abc1de77cb45eda10f67d5e2df2770f988dc16fc4e0269c2d8a'
            '13e69788f0ddf1513fc1bdabde835193d628f8088564a4986699407c838ac0d7'
            'e1ca8c1244c43f78bb320250208c4e6036d5e84cd3e900fc13b9a486e81853d4'
            '6e114a9b7a911653cfc222e9fc034f22538508a762542abcb0b1d8d0d8139d8f'
            'fc7a8d58b5c30c03faa9c75a779f343798f8cafda1071494751dcf789b42818d'
            '46dcf1f9ec01d25064f6a8d56af39a27bc2dda1248ad3bad186056cafc4fce68'
            '6bae04aae315f3a333306ffb9537cf5f834f0a5c4313b26dbe5071380bd6c345'
            '9459d6904ac8e0c8114d89c4f9ad54e5e8fa94d6d873a31a1c04f6bd813849b8'
            'faf63b2411a11a8116afda37cc2929de6501bae345cddbd541b46b95afaeecef'
            'c02ae6250b9c1c57f3146d5726645cf4646764a74b1424e7bda7286a8032da26'
            '6a73f9541c2de74158c0e7cf6b0a58ef774f5a780bf191f2d7ec9cc53efe2bf2')
