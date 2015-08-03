# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-gandhifamily
pkgdesc="Gandhi Sans and Serif font family by Cristóbal Henestrosa and Raúl Plancarte for Librería Gandhi (OpenType)"
url=('http://www.tipografiagandhi.com/')
license=('custom')
pkgver=1.001
pkgrel=1
changelog=ChangeLog.${pkgname}
depends=('fontconfig' 'xorg-font-utils')
arch=('any')
install=$pkgname.install

source=(http://www.tipografiagandhi.com/common/zip/gandhi_sans_and_serif.zip)
md5sums=('67c351573bb0a1c80cd05e91674db0ec')
sha512sums=('4f740cb90c4daf38068910660a76e3a27f8578708a6be71efa528f2955340412cb911d6a6fc6f46bb3baee009bcc20a17f68507bc860630fd4b83d7007bdbc8e')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname}"
  cp -dpr --no-preserve=all "${srcdir}/TipografiaGandhi/"*.otf "${pkgdir}/usr/share/fonts/${pkgname}"
  install -D -m644 "${srcdir}/TipografiaGandhi/ReglasDeUso.rtf" "${pkgdir}/usr/share/licenses/${pkgname}/ReglasDeUso.rtf"
}
