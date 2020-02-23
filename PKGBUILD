# Maintainer: luxcem <a@luxcem.fr>
# Contributor: yuhr <sdn.pate(at)gmail.com>

pkgname=ttf-mutsuki
pkgver=19.232
pkgrel=1
pkgdesc="Japanese classic style font."
url="https://mandel59.github.io/mutsuki/"
license=("custom")
arch=("any")
source=("https://github.com/mandel59/mutsuki/releases/download/v${pkgver}/Mutsuki.ttf.zip"
        "https://github.com/mandel59/mutsuki/releases/download/v${pkgver}/Mutsuki-kana.ttf.zip"
        "https://raw.githubusercontent.com/mandel59/mutsuki/master/LICENSE")
sha256sums=("f4762e790ea99127224c3351de72391138ef3e3a8e645f7676819f4cd08364d4"
            "aa706529c0e9774584d75c789d2d1d749f4eeec92f7b6552740075303ff8b7ea"
            "675cce5445f4588b1271d114422170363daeaccd0d6b46ad7293e289b6cc9a8b")

package() {
  install -d "${pkgdir}"/usr/share/fonts/TTF
  install -m644 *.ttf "${pkgdir}"/usr/share/fonts/TTF/

  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}
