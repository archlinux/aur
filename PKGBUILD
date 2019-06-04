# Maintainer: Sam Whited <sam@samwhited.com>

_fnt_name=national-park
pkgname=ttf-${_fnt_name}
pkgver=v0.0.1
pkgrel=1
pkgdesc="A typeface that mimics U.S. National Park Service signs."
arch=('any')
url="https://nationalparktypeface.com/"
license=('custom:OFL')
source=("https://files.cargocollective.com/c206464/NationalPark.zip"
        "ofl.txt")
sha256sums=('b03567a235e0a81dca30f961704f8f0a352e2dd40a5f91bbce111b31bee17322'
            'a24aca924da18c40798440bd9e97ef0a78868f7f7c5d1ca9c709a29a4e220087')

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF
  install -Dm644 ${srcdir}/*.otf ${pkgdir}/usr/share/fonts/OTF/

  install -Dm644 ${srcdir}/ofl.txt ${pkgdir}/usr/share/licenses/${pkgname}/OFL.txt
}
