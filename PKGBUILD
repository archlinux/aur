# Maintainer: GhettoGirl <github.com/GhettoGirl>

pkgname=fcitx-skins
pkgver=1.3
pkgrel=2
pkgdesc="Rich skin pack for fcitx (contains 8 skins)"
arch=('any')
depends=('fcitx')
source=("http://storage.magiruuvelvet.gdn/aur-data/fcitx-skins/fcitx-skin-pack.tar.gz"
        "http://storage.magiruuvelvet.gdn/aur-data/fcitx-skins/fcitx-skin-aki-0.1.tar.gz"
        "http://storage.magiruuvelvet.gdn/aur-data/fcitx-skins/fcitx-skin-tomoshibi-0.1.tar.gz"
        "http://storage.magiruuvelvet.gdn/aur-data/fcitx-skins/fcitx-skin-tomoshibi-light.tar.gz")
sha1sums=('38731a18bb7c938938ce590337675c962aa07d67'
          'e0ad881c9c8ab5103014f9f973fa9889ec47def6'
          'c3e2d34856917926f1926f3edd0d4f98b152a477'
          'f267e18dcf4c63917c2a0672890cbf89c2155798')

package() {
  base_dir="$pkgdir/usr/share/fcitx/skin"

  cp -r "usr" "$pkgdir"
  cp -r "fcitx-skin-tomoshibi-0.1/tomoshibi" "$base_dir"
  cp -r "fcitx-skin-aki-0.1/aki" "$base_dir"
  cp -r "tomoshibi-light" "$base_dir"
}
