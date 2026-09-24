# Maintainer: mathieu@clabaut.net
# Contributor: mathieu@clabaut.net
_pkgname=private-discuss
pkgname=private-discuss-bin
pkgver=7.8.9
pkgrel=1
pkgdesc="The Sovereign Communication Platform"
arch=('x86_64')
url="https://private-discuss.com"
license=('Proprietary')
replaces=("$_pkgname")
provides=("$_pkgname")
depends=('hicolor-icon-theme')
options=('!strip' '!emptydirs')
source_x86_64=("https://api-v2.private-discuss.com/discuss_releases/linux/${pkgver}/${_pkgname}.bin"  "${_pkgname}".{desktop,png})

package(){
  install -Dm755 private-discuss.bin ${pkgdir}/usr/bin/private-discuss
  install -Dm644 private-discuss.desktop -t ${pkgdir}/usr/share/applications
  install -Dm644 -t "${pkgdir}"/usr/share/icons/hicolor/512x512/apps \
    $_pkgname.png
}
sha256sums_x86_64=('dbf80036694a55123497ba80cbc7f10d616d50bb282dbae5336467e5d75776ba'
                   'e68ed7dd8900a2c203a7eb17ff7c0bd4b72b9a3f1f25221039d1b679240384ca'
                   '630353797cf2d8088e02233ec1614202764f0b027c625a9f6390d9741634fa91')
