# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: metaphy <metaphyman@proton.me>
pkgname=glab-component-generator-bin
pkgver=0.9.0
pkgrel=1
epoch=
pkgdesc="Generate README.md from existing GitLab components"
arch=('x86_64')
url="https://github.com/peschmae/glab-component-generator"
license=('MIT')
source=("https://github.com/peschmae/glab-component-generator/releases/download/v$pkgver/glab-component-generator-v$pkgver-linux-amd64.tar.gz")
sha256sums=('549e79913e6d0917bd4ca8de52026626bbf0fbc05190789c4040ab012ffbe950')

package() {
    cd $srcdir
    install -Dm 755 "glab-component-generator" "$pkgdir/usr/bin/glab-component-generator"
}
