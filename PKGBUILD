# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.2.12
_build=f1
_randomstring=0a46ddfcfad4
_prefix=/opt/Unity

pkgname=unity-editor-language-ja
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Japanese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.2/ja")
sha1sums=('2e154b9b792d0e62e0d7b3ef88a643d10ce03fac')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ja "${_dest}/ja.po"
}

