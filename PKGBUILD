# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2018.4.15f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2018.4.15f1.4.15f1.tar.xz::https://download.unity3d.com/download_unity/13f5a1bf9ca1/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2018.4.15f1.tar.xz")
md5sums=("0c5a858ae4558bb73b8a8cffaf0c8322")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

