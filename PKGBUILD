# Maintainer: TTsdzb <ttsdzb at outlook dot com>
# Maintainer: Jia Yin<lok-ation at outlook dot com>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514@gmail.com>
# Contributor: Bot-wxt1221 <3264117476@qq.com>

pkgname=hmcl-bin
pkgver=3.6.14
pkgrel=1
pkgdesc="A Minecraft Launcher which is multi-functional, cross-platform and popular."
arch=('any')
url="https://github.com/huanghongxun/HMCL"
license=('GPL3')
depends=('java-runtime' 'gtk2')
provides=('hmcl')
conflicts=('hmcl')
replaces=('hmcl-stable-bin')
source=("hmcl.desktop"
	      "hmcl.png"
        "LICENSE::https://raw.githubusercontent.com/HMCL-dev/HMCL/refs/heads/main/LICENSE"
        "${pkgname}-${pkgver}-${pkgrel}.sh::https://github.com/HMCL-dev/HMCL/releases/download/release-${pkgver}/HMCL-${pkgver}.sh")
sha256sums=('9a561081f8f3ece3da114afd4f6d90565ca0e04716eef4ea88c6b4306566ae9b'
            '29120471641c51aae3ee84f8bcc16e1e4148c153085f71ccb9680415007f82ad'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '16e0e0005b87c900095de04c0a1baa7b744951e72d218b6a849dcd17568f670e')

noextract=("${pkgname}-${pkgver}-${pkgrel}.sh")

package() {
  install -Dm755 "${pkgname}-${pkgver}-${pkgrel}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "hmcl.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "hmcl.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
