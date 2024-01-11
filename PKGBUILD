# Maintainer: Doclic <doclic@tutanota.com>

pkgname=vtex2-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="A VTF conversion and creation tool"
arch=(i686 x86_64 aarch64)
url="https://github.com/StrataSource/vtex2"
license=('MIT')
depends=('libglvnd' 'glibc' 'gcc-libs' 'qt6-base')
provides=(vtex2)
conflicts=(vtex2)
source=("https://github.com/StrataSource/vtex2/releases/download/v${pkgver}/vtex2.linux-amd64.zip"
       "vtex2-repo::git+https://github.com/StrataSource/vtex2.git")
md5sums=('42d22ca2c3239bbdfe57e7557e1f8e27'
         'SKIP')

package() {
   install -Dm755 "$srcdir/vtex2" "$pkgdir/usr/bin/vtex2"
   install -Dm755 "$srcdir/vtfview" "$pkgdir/usr/bin/vtfview"
   install -Dm644 "$srcdir/vtex2-repo/LICENSE" "$pkgdir/usr/share/licenses/vtex2-bin/LICENSE"
}
