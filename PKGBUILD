# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2017.4.26f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2017.4.26f1.4.26f1.tar.xz::https://download.unity3d.com/download_unity/3b349d10f010/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.4.26f1.tar.xz")
md5sums=("79b38eebe7a6cc4daa6ebb027fb9f76d")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

