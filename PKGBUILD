# Maintainer: Fabian Bornschein <fabiscafe@archlinux.org>
pkgname=(
  annotation-mono.otf
  annotation-mono.ttf
  annotation-mono.variable
  annotation-mono.variable.woff2
  annotation-mono.woff2
)
pkgbase=annotation-mono
pkgver=0.2
pkgrel=1
pkgdesc="A lovingly crafted handwriting-style monospace font."
arch=('any')
url="https://qwerasd205.github.io/AnnotationMono/"
license=('OFL-1.1')
makedepends=(git)
provides=(
  annotationmono
  annotation-mono
)
source=("git+https://github.com/qwerasd205/AnnotationMono.git#tag=v${pkgver}")
b2sums=('43ca1e7210b5b69e6666f23166e493caa909f0fa11661250f4851bd4b93221f27e7382b2f0c15865a248aa8f4b4d271596270bc7021cca08495445b929c01cff')

package_annotation-mono.otf() {
  pkgdesc+=" (otf edition)"

  install -m 0755 -d \
	  "${pkgdir}/usr/share/fonts/annotation-mono/otf" \
	  "${pkgdir}/usr/share/licenses/annotation-mono.otf"

  cd AnnotationMono
  install -m 0644 -p ./dist/otf/*.otf "${pkgdir}/usr/share/fonts/annotation-mono/otf/"
  install -m 0644 -p ./LICENSE "${pkgdir}/usr/share/licenses/annotation-mono.otf/"
}

package_annotation-mono.ttf() {
  pkgdesc+=" (ttf edition)"

  install -m 0755 -d \
	  "${pkgdir}/usr/share/fonts/annotation-mono/ttf" \
	  "${pkgdir}/usr/share/licenses/annotation-mono.ttf"

  cd AnnotationMono
  install -m 0644 -p ./dist/ttf/*.ttf "${pkgdir}/usr/share/fonts/annotation-mono/ttf/"
  install -m 0644 -p ./LICENSE "${pkgdir}/usr/share/licenses/annotation-mono.ttf/"
}

package_annotation-mono.variable() {
  pkgdesc+=" (variable edition)"

  install -m 0755 -d \
	  "${pkgdir}/usr/share/fonts/annotation-mono/variable" \
	  "${pkgdir}/usr/share/licenses/annotation-mono.variable"

  cd AnnotationMono
  install -m 0644 -p ./dist/variable/*-VF.ttf "${pkgdir}/usr/share/fonts/annotation-mono/variable/"
  install -m 0644 -p ./LICENSE "${pkgdir}/usr/share/licenses/annotation-mono.variable/"
}

package_annotation-mono.variable.woff2() {
  pkgdesc+=" (variable woff2 edition)"

  install -m 0755 -d \
	  "${pkgdir}/usr/share/fonts/annotation-mono/variable.woff2" \
	  "${pkgdir}/usr/share/licenses/annotation-mono.variable.woff2"

  cd AnnotationMono
  install -m 0644 -p ./dist/variable_woff2/*-VF.woff2 "${pkgdir}/usr/share/fonts/annotation-mono/variable.woff2/"
  install -m 0644 -p ./LICENSE "${pkgdir}/usr/share/licenses/annotation-mono.variable.woff2/"
}

package_annotation-mono.woff2() {
  pkgdesc+=" (woff2 edition)"

  install -m 0755 -d \
	  "${pkgdir}/usr/share/fonts/annotation-mono/woff2" \
	  "${pkgdir}/usr/share/licenses/annotation-mono.woff2"

  cd AnnotationMono
  install -m 0644 -p ./dist/woff2/*.woff2 "${pkgdir}/usr/share/fonts/annotation-mono/woff2/"
  install -m 0644 -p ./LICENSE "${pkgdir}/usr/share/licenses/annotation-mono.woff2/"
}


