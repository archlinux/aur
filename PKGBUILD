# Maintainer: Smit S. Patil <smit17av@gmail.com>
pkgname=shader-minifire-bin
pkgver=1.1
pkgrel=6
pkgdesc="tool that minifies and obfuscates shader code (GLSL and HLSL)"
arch=('any')
url="https://github.com/laurentlb/Shader_Minifier"
license=('Apache')
depends=('mono')
options=('!strip')
source=("https://github.com/laurentlb/Shader_Minifier/releases/download/${pkgver}.${pkgrel}/shader_minifier.exe")
noextract=('shader_minifier.exe')
md5sums=('SKIP')

package() {
   mkdir $pkgdir/usr/bin -p
   cp ../shader-minifier $pkgdir/usr/bin
   chmod a+x $pkgdir/usr/bin/shader-minifier
   mv ../shader_minifier.exe $pkgdir/usr/bin
}
