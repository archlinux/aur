# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.1.6f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.1.6f1.1.6f1.tar.xz::https://download.unity3d.com/download_unity/f2970305fe1c/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.1.6f1.tar.xz")
md5sums=("bd57f34f030bb7e5a7b3f8e0741d3e10")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

