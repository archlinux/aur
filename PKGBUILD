# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2017.4.19f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2017.4.19f1.4.19f1.tar.xz::https://download.unity3d.com/download_unity/47cd37c28be8/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.4.19f1.tar.xz")
md5sums=("8239cd2ec8bd5a675b0b53e5e4a8a163")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

