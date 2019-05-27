# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/Unity

pkgname=unity-editor-webgl
pkgver=2019.1.4f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.1.4f1.1.4f1.tar.xz::https://download.unity3d.com/download_unity/ffa3a7a2dd7d/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.1.4f1.tar.xz")
md5sums=("9da330ab3490e1e088cea6c6b270b70f")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

