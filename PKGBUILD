# Maintainer: KillWolfVlad <github.com/KillWolfVlad>

pkgname=b2t
pkgver=0.0.0_alpha
pkgrel=2
pkgdesc="Binary to text"
arch=("any")
url="https://github.com/KillWolfVlad/b2t"
license=("GPL3")
depends=("mono>=4.8.0")
provides=("b2t")
conflicts=("b2t")
replaces=("b2t")
source=("${url}/releases/download/v${pkgver//_/-}/${pkgname}.tar.xz"
        "b2t.sh")
sha512sums=('846c50775c359601ba32bf240c4b24ee2e35c771f9e6e3d3026fdf50f65a8a3650ceec4c188e09760752e0ae017bfaea81c6e4ce0b283374623756769dccf110'
            'e0b4f3d196949387d33bef522fdabdd62be3135b49dce18e639a5842ae224c4c1b1690bbf2dd70ae9c91b7eb7e7aaca64ce6fce3d107497ffcfdd16dd30a0ff5')
backup=()
install=''
package() {
  cd ${srcdir}
  install -D -m755 "./b2t.exe" "${pkgdir}/usr/share/b2t/bin/b2t.exe"
  install -D -m755 "./b2t.sh" "${pkgdir}/usr/bin/b2t"
}
