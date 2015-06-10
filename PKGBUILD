# Maintainer: Christoph Drexler <chrdr at gmx dot at>
# Contributor: hdh <hieu.d.hoang@gmail.com>

pkgname=otf-adf
pkgver=20150406
pkgrel=1
pkgdesc="Open Type Fonts released by Arkandis Digital Foundry"
arch=('any')
url="http://arkandis.tuxfamily.org/adffonts.html"
license=('GPL2')
groups=('adf-fonts')
depends=('fontconfig' 'xorg-mkfontdir' 'xorg-mkfontscale')
install=otf.install
source=(
http://arkandis.tuxfamily.org/fonts/Accanthis-Std-20101124.zip
http://arkandis.tuxfamily.org/fonts/AurelisNo2-Std-20110311.zip
http://arkandis.tuxfamily.org/fonts/Baskervald-Std-20150322.zip
http://arkandis.tuxfamily.org/fonts/Berenis-Pro-20150322.zip
http://arkandis.tuxfamily.org/fonts/Electrum-Exp-20100711.zip
http://arkandis.tuxfamily.org/fonts/Gillius-Collection-20110312.zip
http://arkandis.tuxfamily.org/fonts/Ikarius-Serie-20111024.zip
http://arkandis.tuxfamily.org/fonts/Irianis-Std-20100729.zip
http://arkandis.tuxfamily.org/fonts/Libris-Std-20110117.zip
http://arkandis.tuxfamily.org/fonts/Mekanus-Std-20111025.zip
http://arkandis.tuxfamily.org/fonts/NeoGothis-Std-20150405.tar.gz
http://arkandis.tuxfamily.org/fonts/Oldania-Std-20150406.tar.gz
http://arkandis.tuxfamily.org/fonts/Romande-Collection-20110730.zip
http://arkandis.tuxfamily.org/fonts/Solothurn-Std-20111228.zip
http://arkandis.tuxfamily.org/fonts/Tribun-Std-20120228.zip
http://arkandis.tuxfamily.org/fonts/Universalis-Std-20110904.zip
http://arkandis.tuxfamily.org/fonts/OrnementsADF.zip
http://arkandis.tuxfamily.org/fonts/SymbolADF.zip
http://arkandis.tuxfamily.org/fonts/Keypad-20101223.zip
)

md5sums=('616027f748d7bb3ac017fb210990aacc'
         '4ede1e0d29128cb6a2363f27234f4da8'
         'e45b27a1b2a799a1b5022a83a812b336'
         'f244ff17954e5eaaa4ba2aca9e2cd573'
         '4f003c6b978096720da65d76e530beb2'
         '66a7bc74ab901c605b34e8811adfbd30'
         '38b23c1abe232815914ea7346c270fb1'
         'b3c0b4fe19127bc93ab31382761b9ff3'
         '0b8cf18fabb6db0435af2326f96240fa'
         'a67e51c4604feb3612b2e971f3eb7a43'
         'cff539847028074fb52a58f4170d798e'
         '34ec5d3b0af9af317f734ca70d72fd96'
         '961d3a2bcee5666074b71ec34d086747'
         '7103b84368351a0527285402cea03d71'
         '6037f8b5ab5b979f790a39963b69f63c'
         '0d909f43a9dc2d1cf0785f6a93048edb'
         'a481b57003078d503e73a121991127d8'
         '9ee8b15af0fe9e23d55b046ce735b70f'
         '55b9bbc646a385840878da37b31c6591')

build() {
  # nothing to do
  true
}

package() {
  install -d ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/*/*.[Oo][Tt][Ff] ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff] ${pkgdir}/usr/share/fonts/OTF/
  install -Dm644 ${srcdir}/*/*/[Oo][Tt][Ff]/*.[Oo][Tt][Ff] ${pkgdir}/usr/share/fonts/OTF/
}
