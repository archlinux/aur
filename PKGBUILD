# Maintainer: Oscar Morante <spacepluk@gmail.com>

_version=2018.3.0
_build=b5
_randomstring=01088ee0a3a8
_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-language-zh-cn
pkgver=${_version}${_build}
pkgrel=1
pkgdesc="Chinese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.3/zh-cn")
sha1sums=('a4c1220d7ab8de4f394d352634107098a72d6799')
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv zh-cn "${_dest}/zh-cn.po"
}

