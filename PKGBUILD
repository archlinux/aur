# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=toolkit
pkgver=0.1.0
pkgrel=1
pkgdesc="A toolbox for the CLI, rapidly speeding up file editing and data management processes."
arch=(any)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(bat)
optdepends=('nvim: the recommended editor for power users')
conflicts=(qed)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '728b66b7c5c03a6156aaf55164a2932b194fefd4739482b1f5b48e1a538e2ceef0b9f6dbd6867c34f46da070b9d9f6d0e92cebffd1059c086833308155869cc8'
  'c5f3b673936f24261914ea7eae9612c7772c1d117ca2ba3194bc9791a3f5e6dac738b0a1456cb9a563f435f8564d3524c3b03fa6e52628f8b3fc5ca4caae5d83'
  )
md5sums=(
  '807cbc1d045824c3b33476ff3f040f76'
  '37425790dcfba28f0f1a399e6dfc0029'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
}
