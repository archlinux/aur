# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=benthos-bin
_pkgname=${pkgname%-bin}
pkgdesc='Declarative stream processing for mundane tasks and data engineering.'
url='https://benthos.dev'
_url='https://github.com/Jeffail/benthos'
_branch='master'
pkgver=3.46.0
pkgrel=1
arch=(aarch64 armv6h x86_64)
license=("MIT")
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
sha256sums=('0a8a58232020d1320dac89ee6e2a734b92bed5bf15e46801d29323765eed0722')
sha256sums_aarch64=('6bcb4903c704ea1fa650abcad41597ff6dbfbe0156bf0b27feb62175dfdfea8a')
sha256sums_armv6h=('296b7d4a99c8406b7f590a041c902ab3cc60063062a11b4ee8d0ddf616d65c14')
sha512sums=('94f2913332f273003d958f816e5f330489d6b231190dcd63d44577627e4a05c4f7aac7e3ebe7c089150b3067944514a2f3d7ee180830ec8182d8aa616e375354')
sha512sums_aarch64=('4976908687a9ceace9d600dc1ca5f9073831005c097bdb939ea7ee21f1ecb874984ab1101e99724cb62cd4355a8902b2d2e0b4e5023b2dc9bed1128ab37ba443')
sha512sums_armv6h=('72a64f1057bdfe1279f41e7137cdc81de4b8b4a85cf126cb92703f295790786f89597a682e9c1c56339045f18ab6f19fd9af15134ba140b8157153c9438d54cf')
b2sums=('e8bf36448b4e2162a43d7eec7624eb115fa1c7cda78abdb59b2258be65a607b8ef257fdd95f3b2900a4a59c315f68eaf19fd67ef0c0fbb5676e17b352a8fd322')
b2sums_aarch64=('43a6ad750092afd3839f09f517bd5b5f7cae3301e49ca275188b96d2f5188d69c98efb4c3be7a364a2dab8278e0e86a5537e0caa2a2c01378deb341c13cd8d65')
b2sums_armv6h=('8185dfaec66dac16a3975862a3b194fb42d4bea411fbae99c9586bf0b466e3866957030e4cbba182f2aa6611249bece4b6dfae441b3a2294fbba33c2390e7106')

package() {
  install -Dm755 $_pkgname "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 *.md -t "${pkgdir}/usr/share/doc/${_pkgname}/"
}
