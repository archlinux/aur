# Maintainer: anex <lane.wiscombe_at_gmail_dot_org>
# Maintainer: Philip Müller <philm_at_manjaro_dot_org>
# Maintainer: Rob McCathie <rob_at_manjaro_dot_org>

pkgbase=menda-themes
pkgname=("${pkgbase}" "${pkgbase}-dark")
pkgver=20150103
pkgrel=1
_git='f0b3657cb131df0f55c2b554f8691dc3a1a3bd87'
arch=('any')
url="https://github.com/manjaro/artwork-menda"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=("menda-circle-icon-theme-git: Recommended icon theme")
source=("${pkgbase}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${_git}.tar.gz")
sha1sums=('SKIP')

package_menda-themes() {
  pkgdesc="Manjaro's official Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell themes"
  replaces=('gtk-theme-menda')
  
  install -dm755 "${pkgdir}/usr/share/themes"
  install -Dm755 "${srcdir}/artwork-menda-${_git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/artwork-menda-${_git}/Menda" "${pkgdir}/usr/share/themes"
}

package_menda-themes-dark() {
  pkgdesc="Manjaro's official Gtk2, Gtk3, Metacity, Xfwm, Openbox, Cinnamon and GNOME Shell themes. Dark version."
  
  install -dm755 "${pkgdir}/usr/share/themes"
  install -Dm755 "${srcdir}/artwork-menda-${_git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r "${srcdir}/artwork-menda-${_git}/Menda-Dark" "${pkgdir}/usr/share/themes"
}
