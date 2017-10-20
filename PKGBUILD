# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=androidscreencast-bin
pkgver=0.3.1
pkgrel=5
pkgdesc='Desktop app to control an android device remotely using mouse and keyboard'
arch=('any')
url='https://code.google.com/archive/p/androidscreencast'
license=('Apache')
depends=('java-runtime')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/androidscreencast/androidscreencast-${pkgver//./_}.jar"
        "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/androidscreencast/ddmlib-${pkgver//./_}.jar"
        'androidscreencast')
sha256sums=('1d6d048cb8c75ebd11ae8d35fb7f2ba44401be62c004ff099d410d8e4862970c'
            '73054595a00c52ec761d5f5cd4b81c66e561b841488bc4e892aab6624ac2f252'
            '8f59c99dc2ab926a1fa0464b4a1ea01480cd0d5311ef9816bc99a9c00b542e74')

package() {
  install -Dm644 "${srcdir}"/androidscreencast-${pkgver//./_}.jar "${pkgdir}"/usr/share/java/androidscreencast/androidscreencast-${pkgver//./_}.jar
  install -Dm644 "${srcdir}"/ddmlib-${pkgver//./_}.jar "${pkgdir}"/usr/share/java/androidscreencast/ddmlib-${pkgver//./_}.jar
  install -Dm755 "${srcdir}"/androidscreencast "${pkgdir}"/usr/bin/androidscreencast
}
