# Contributor: Aashik S  aashiks at gmail dot com
# Maintainer: http://smc.org.in
# Contributor: Akshay S Dinesh asdofindia at gmail dot com

pkgname=ttf-malayalam-font-manjari
pkgver=0.1.0+20161126
pkgrel=1
pkgdesc="This is Manjari, a font belonging to a set of TrueType and OpenType fonts released under the 
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007 for Malayalam Language."
arch=(any)
url="http://smc.org.in/fonts/"
depends=(fontconfig xorg-font-utils)
source=(
"https://smc.org.in/downloads/fonts/manjari/Manjari-Regular.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Thin.ttf"
"https://smc.org.in/downloads/fonts/manjari/Manjari-Bold.ttf"
"67-smc-manjari.conf"
)
md5sums=('9c4e2124e535470350ed6fe68aa58502'
         '3b4e4a1972888c52798e42b72cb3b70c'
         '92fc89f04d7b6c6a9f119dadebdc3a4c'
         '98923c2e7c4df841f7e8ee0f3e05f9f5')
install=ttf-malayalam-fonts.install
package() {
  mkdir -p "${pkgdir}/usr/share/fonts/TTF" || return 1
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF" 
  mkdir -p "${pkgdir}/etc/fonts/conf.d" || return 1
  install *.conf "${pkgdir}/etc/fonts/conf.d" || return 1
}
