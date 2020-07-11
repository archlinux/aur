# Maintainer: Ykkzde <dmitry@ykkz.de>

pkgname=random-case-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="Randomize case of your input text."
url="https://gitlab.com/ykkzde/random-case"
license=('GPL3')
provides=('random-case')
conflicts=('random-case-git')
depends=(
    gcc-libs
)

source=("random-case-$pkgver::https://github.com/ykkzde/random-case/releases/download/v$pkgver/random-case-v$pkgver-linux-x64")

# Checksums automatically set in CI, see: /.gitlab-ci.yml
sha512sums=('dc9e049e7351e804294a9134f5eb83a6006413664df6172c041fbf4a8dc0631f5b3e106a6a4f5190ce9f32d28feac60277764d9e91a6358ff413dca41b714597')

arch=('x86_64')

package() {
    install -D "$srcdir/random-case-$pkgver" "$pkgdir/usr/bin/random-case"
}
