# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2018.3.5f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2018.3.5f1.3.5f1.tar.xz::https://download.unity3d.com/download_unity/76b3e37670a4/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2018.3.5f1.tar.xz")
md5sums=("2ccce9fe826cea744d65f7c17666886f")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

