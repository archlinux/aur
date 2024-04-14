# Maintainer: Pylogmon <pylogmon@outlook.com>

pkgname=pot-translation-bin
_pkgname=pot-translation
prjname=pot
reponame=pot-desktop
pkgver=2.7.10
pkgrel=1
pkgdesc="一个跨平台的划词翻译软件"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/pot-app/pot-desktop"
license=('GPL3')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator' 'xdotool' 'libxcb' 'libxrandr' 'tesseract' 'tessdata')

source_x86_64=("${prjname}-${pkgver}-x86_64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_amd64.deb")
source_i686=("${prjname}-${pkgver}-i686.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_i386.deb")
source_aarch64=("${prjname}-${pkgver}-aarch64.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_arm64.deb")
source_armv7h=("${prjname}-${pkgver}-armv7h.deb::${url}/releases/download/${pkgver}/${prjname}_${pkgver}_armhf.deb")

sha512sums_x86_64=('a447ddb49ecf8179513ef3f99daa954e144e5becf1a9d940de0da30762b0ebd9e4020293b1be751fff28c1da841566ca1977e0bed808218867946889880e9aa9')
sha512sums_i686=('86105545eacc6c630b820754a78152488cead810ed0d9be669c259cbf7531a0e1f6c87cc7fb9cfa3d8302dd69543b6757f7e6c68bed9cbaa1762b19aefc6489a')
sha512sums_aarch64=('88bca7b046554bb81561341ff66be4a1039d572039be20be5f72ab0339100a80e699cb3987ea4ed375091a152fef9da823ea9e2e8224b5438846ce811c062245')
sha512sums_armv7h=('4f11452640ffd9174e5c4f1ad3b0d099b56a3e45c4e1cdc88373b697df1c794fa9f1746a0dee0abf36b67a6de64c6e95858aec5b29690db40d9ca316a6835c00')

package() {
    tar xpf data.tar.gz -C ${pkgdir}
    chown -R root:root ${pkgdir}
}
