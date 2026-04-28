# Maintainer:

pkgname=(otf-annotation-mono ttf-annotation-mono ttf-annotation-mono-variable woff2-annotation-mono woff2-annotation-mono-variable)
pkgbase=annotation-mono-font
pkgver=0.3
pkgrel=1
pkgdesc='A lovingly crafted handwriting-style monospace font by Qwerasd'
arch=(any)
url="https://qwerasd205.github.io/AnnotationMono"
license=(OFL-1.1-RFN)
makedepends=(git)
source=("git+https://github.com/qwerasd205/AnnotationMono.git#tag=v${pkgver}")
b2sums=('dbd074239c75f353c365e645954df1ea600e891b4a0697f9e0214dd611bac1a2f725bf01cc9bd6fbc2b1ee472d895505319de9ec7b7a5469f68db7b94c2a5764')

package_otf-annotation-mono() {
  pkgdesc+=' (20 static cuts)'
  cd AnnotationMono
  install -Dm644 -pt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -pt "$pkgdir/usr/share/fonts/$pkgname" dist/otf/*.otf
}

package_ttf-annotation-mono() {
  pkgdesc+=' (20 static cuts)'
  cd AnnotationMono
  install -Dm644 -pt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -pt "$pkgdir/usr/share/fonts/$pkgname" dist/ttf/*.ttf
}

package_ttf-annotation-mono-variable() {
  pkgdesc+=' (variable ttf font)'
  cd AnnotationMono
  install -Dm644 -pt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -pt "$pkgdir/usr/share/fonts/$pkgname" dist/variable/AnnotationMono-VF.ttf
}

package_woff2-annotation-mono() {
  pkgdesc+=' (20 static cuts)'
  cd AnnotationMono
  install -Dm644 -pt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -pt "$pkgdir/usr/share/fonts/$pkgname" dist/woff2/*.woff2
}

package_woff2-annotation-mono-variable() {
  pkgdesc+=' (variable woff2 font)'
  cd AnnotationMono
  install -Dm644 -pt "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -pt "$pkgdir/usr/share/fonts/$pkgname" dist/variable_woff2/AnnotationMono-VF.woff2
}
