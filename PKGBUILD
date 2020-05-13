# Maintainer: Gerard Salvatella <gerard.salvatella@gmail.com>

pkgname=ultimate-oldschool-pc-font-pack
pkgver=1.01
_relver=1.01
_Px437_dir="Px437 (TrueType - DOS charset)"
_PxPlus_dir="PxPlus (TrueType - extended charset)"
pkgrel=1
pkgdesc="System and BIOS fonts from DOS-era IBM PCs and compatibles"
url="https://int10h.org/oldschool-pc-fonts"
arch=(any)
license=(custom)
_tarname=${pkgname}_v${_relver}
source=("$_tarname.zip::https://int10h.org/oldschool-pc-fonts/download/ultimate_oldschool_pc_font_pack_v1.01.zip")
sha256sums=('992f37be922610249ae4287dec8418bcfdbddc0b76502ec9df974270ced0f462')

package() {
  install -d "$pkgdir/usr/share/fonts/${pkgname}" "$pkgdir/usr/share/licenses/${pkgname}"
  install -t "$pkgdir/usr/share/fonts/${pkgname}" -m644 "${srcdir}/${_Px437_dir}"/*.ttf "${srcdir}/${_PxPlus_dir}"/*.ttf
  install -Dm644 "${srcdir}/LICENSE.TXT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

