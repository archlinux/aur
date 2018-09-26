# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.3.0
_build=b2
_randomstring=21e0e8a5466d
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-ja
pkgver=${_version}${_build}
pkgrel=2
pkgdesc="Japanese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.3/ja")
sha1sums=('b50140a2ee44b3e7f6aff40e1f8634788e188bed')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv ja "${_dest}/ja.po"
}

