# Maintainer: Oscar Morante <spacepluk@gmail.com>

_prefix=/opt/UnityLts

pkgname=unity-editor-lts-webgl
pkgver=2017.4.25f1
pkgrel=1
pkgdesc="Allows building your Unity projects for the WebGL platform"
arch=('x86_64')
url='https://unity3d.com/'
license=('custom')
depends=('unity-editor-lts'
         'ffmpeg'
         'gzip')
source=("2017.4.25f1.4.25f1.tar.xz::https://download.unity3d.com/download_unity/9cba1c3a94f1/LinuxEditorTargetInstaller/UnitySetup-WebGL-Support-for-Editor-2017.4.25f1.tar.xz")
md5sums=("1d4b3fb39d6e92f1e88e55e9c7ec9552")
options=(!strip)
PKGEXT='.pkg.tar' # Prevent compressing of the final package

package() {
  _dest="${pkgdir}${_prefix}"
  install -d "${_dest}"
  mv Editor "${_dest}"
}

