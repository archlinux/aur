# Maintainer:

pkgname=(otf-annotation-mono ttf-annotation-mono ttf-annotation-mono-variable)
pkgbase=annotation-mono-font
pkgver=0.2
pkgrel=1
pkgdesc='A lovingly crafted handwriting-style monospace font by Qwerasd'
arch=(any)
url="https://github.com/qwerasd205/AnnotationMono"
license=(OFL-1.1-RFN)
source=(
  "$url/releases/download/v$pkgver/AnnotationMono_v$pkgver.zip"
  "LICENSE.txt::$url/raw/refs/tags/v$pkgver/LICENSE"
)
sha512sums=(
  'cb2e637a844f8df147920c68058b0e70d2a20df6f3d9c040e928fa44210e1e94e49ca3b590c7b4d00b7db978e6f06ac1fda896df9c4eb8bb48c89b344e54ebce'
  '57343f16026d773252ca05d297f98d9624b90c566461b1005764ba6baa6753d2d439271d7e2554d9f9dfb909b469caad43a69c6df783fb8264028c1663971770'
)

package_otf-annotation-mono() {
  pkgdesc+=' (20 static cuts)'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  # cd "AnnotationMono_v${pkgver}/dist/otf"
  cd dist/otf
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" *.otf
}

package_ttf-annotation-mono() {
  pkgdesc+=' (20 static cuts)'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  # cd "AnnotationMono_v${pkgver}/dist/ttf"
  cd dist/ttf
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" *.ttf
}

package_ttf-annotation-mono-variable() {
  pkgdesc+=' (variable font)'
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
  # cd "AnnotationMono_v${pkgver}/dist/variable"
  cd dist/variable
  install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" AnnotationMono-VF.ttf
}
