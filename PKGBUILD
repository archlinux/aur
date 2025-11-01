# Maintainer: pank-su <pank@pank.su>

pkgname='godot-kotlin-jvm-bin'
pkgver='0.14.3'
_godotver='4.5.1'
pkgrel=1
pkgdesc='Kotlin/JVM binding for the Godot Game Engine'
arch=('x86_64')
url='https://github.com/utopia-rise/godot-kotlin-jvm'
license=('MIT')
source=("${pkgname}_${pkgver}_${_godotver}.zip::https://github.com/utopia-rise/godot-kotlin-jvm/releases/download/${pkgver}-${_godotver}/godot-kotlin-jvm_editor_linuxbsd_x86_64_release_${pkgver}-${_godotver}.zip")
sha256sums=('a3c89c3f555a566b62625ca38976fbe68ada38bb509a9b809601e303888661aa')

prepare() {
    cd "$srcdir"
    
    
    mv "godot.linuxbsd.editor.x86_64.jvm.${pkgver}" "godot-kotlin-jvm"
}

package() {
  install -Dm755 ./godot-kotlin-jvm "${pkgdir}/usr/bin/godot-kotlin-jvm"
}
