# Contributor: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=androidscreencast-bin
pkgver=0.0.13s
pkgrel=1
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
arch=('any')
#old_url='https://code.google.com/archive/p/androidscreencast'
url='https://github.com/xSAVIKx/AndroidScreencast'
license=('Apache')
depends=('java-runtime>=7' 'android-tools')
source=("https://github.com/xSAVIKx/AndroidScreencast/releases/download/v$pkgver/androidscreencast-$pkgver-linux.tar.gz"
        'androidscreencast')
sha256sums=('3f2b33b7d7067d78793c49ab3b59f4bb7d2ae939b583cae6dd4e71919ac82329'
            '8f59c99dc2ab926a1fa0464b4a1ea01480cd0d5311ef9816bc99a9c00b542e74')

package() {
  install -Dm644 "${srcdir}"/androidscreencast-${pkgver}-executable.jar "${pkgdir}"/usr/share/java/androidscreencast/androidscreencast-${pkgver}-executable.jar
  install -Dm755 "${srcdir}"/androidscreencast "${pkgdir}"/usr/bin/androidscreencast
}
