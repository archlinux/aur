# Maintainer: JoshuaRLi <joshua.r.li.98 at gmail com>
pkgname=sn-bin
pkgver=2.0.42
pkgrel=1
pkgdesc="A simple and private notes app."
arch=('x86_64')
url="https://github.com/standardnotes/desktop"
license=('GPL3')
provides=('sn')

source_x86_64=("https://github.com/standardnotes/desktop/releases/download/v${pkgver}/standard-notes-${pkgver}-x86_64.AppImage")
noextract=("standard-notes-${pkgver}-x86_64.AppImage")
# stripping an AppImage binary will pretty much destroy it, so tell makepkg not to do so
options=(!strip)
sha256sums_x86_64=('55aa58ebd78a4186d190895042009047c6b346626df185ddb478b54a2098f318')

package () {
  install -Dm 775 "standard-notes-${pkgver}-x86_64.AppImage" "${pkgdir}/usr/bin/sn"
}
