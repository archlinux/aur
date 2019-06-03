# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2017.4.28f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2017.4.28f1.4.28f1.tar.xz::https://download.unity3d.com/download_unity/e3a0f7dd2097/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.4.28f1.tar.xz")
md5sums=("a49cd4c39957f311d91f2dcc764cee08")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

