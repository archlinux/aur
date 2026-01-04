# Maintainer:

pkgname=(otf-annotation-mono ttf-annotation-mono ttf-annotation-mono-variable woff2-annotation-mono woff2-annotation-mono-variable)
pkgbase=annotation-mono-font
pkgver=0.2
pkgrel=2
pkgdesc='A lovingly crafted handwriting-style monospace font by Qwerasd'
arch=(any)
url="https://qwerasd205.github.io/AnnotationMono"
license=(OFL-1.1-RFN)
makedepends=(git)
source=("git+https://github.com/qwerasd205/AnnotationMono.git#tag=v${pkgver}")
b2sums=('43ca1e7210b5b69e6666f23166e493caa909f0fa11661250f4851bd4b93221f27e7382b2f0c15865a248aa8f4b4d271596270bc7021cca08495445b929c01cff')

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
