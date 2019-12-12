# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2018.4.14f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2018.4.14f1.4.14f1.tar.xz::https://download.unity3d.com/download_unity/05119b33d0b7/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2018.4.14f1.tar.xz")
md5sums=("4f1052b0f4671ec60b356bc7928af69a")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

