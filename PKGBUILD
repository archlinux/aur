# Maintainer: Kirisame Marisa <jackeyz2022@mail.ru>
pkgname='hmcl-clean-bin'
pkgver=3.5.3.222
pkgrel=1
pkgdesc="Clean Version of HMCL, remove dev/nightly warnings, multiplayer(not FOSS), sponsor messages and so on. "
arch=('x86_64')
url="https://github.com/weiliang1503/HMCL-Clean"
license=('GNU General Public License v3.0')
depends=('java-runtime')
source=("https://github.com/weiliang1503/HMCL-Clean/releases/download/Release/hmcl.jar"
        "hmcl.desktop"
        "hmcl-launch-script"
        "craft_table.png")
sha256sums=('c9e05e3c4cd90b5b37eb85abddca92d82aa1a863b0d3ad59c04e541c7d010093'
            '9a561081f8f3ece3da114afd4f6d90565ca0e04716eef4ea88c6b4306566ae9b'
            '9100404ad7405e9ce38a1d566a6039c9ee6bcec87eff1825adb9f7c32ca13a6a'
            '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c')

package() {
  install -Dm755 "hmcl-launch-script" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hmcl.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm644 "craft_table.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
}

