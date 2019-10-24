# Maintainer: Oscar Morante <spacepluk at gmail dot com>

_prefix=/opt/UnityBeta

pkgname=unity-editor-beta-webgl
pkgver=2019.3.0b8
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-beta'
         'ffmpeg'
         'gzip'
         'ncurses5-compat-libs')
source=("2019.3.0b8.3.0b8.tar.xz::https://beta.unity3d.com/download/7eb5456f98b4/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2019.3.0b8.tar.xz")
md5sums=("c85abf35ec34ba6d743daf57d5e7efa9")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

