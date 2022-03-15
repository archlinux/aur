# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=BetterBin
pkgname=betterbin
pkgver=1.0.r70
pkgrel=1
pkgdesc='Various useful shell scripts to increace productivity and efficiency in your workflow'
arch=(x86_64)
url="https://gitlab.com/qYp/${pkgname}"
license=('MIT')
depends=()
makedepends=(git)                 
source=(
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha256sums=(
  'f6f0c3513740b06f0e3113056e9fe4856dec30398ba8d6c2a6694fe67e782a4b'
  'e89d48d8b5d6fc9c252e9b1c77489f237e41275f7d1db44965e110d7e3709fcd'
  )

package() {
  install -Dm775 usr/bin/* -g wheel -o ${USER} -t "${pkgdir}/usr/bin/"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
