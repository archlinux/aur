# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-language-zh-cn
pkgver=2018.2.20f1
pkgrel=1
pkgdesc="Chinese Language Pack (Preview)"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor')
source=("https://new-translate.unity3d.jp/v1/live/54/2018.2/zh-cn")
md5sums=("SKIP")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}/Editor/Data/Localization"
  install -d "${_dest}"
  mv zh-cn "${_dest}/zh-cn.po"
}

