# Maintainer: metaphy <metaphyman [at] proton [dot] me>
pkgname=glab-component-generator-bin
pkgver=0.10.0
pkgrel=1
epoch=
pkgdesc="Small Golang CLI to generate README for Gitlab CI components"
arch=('x86_64')
url="https://github.com/peschmae/glab-component-generator"
license=('MIT')
source=("https://github.com/peschmae/glab-component-generator/releases/download/v$pkgver/glab-component-generator-v$pkgver-linux-amd64.tar.gz")
sha256sums=('c50c8eb385b041635b2be5def182f8e5a589d54861843483d7503ea50f75da31')

package() {
    cd $srcdir
    install -Dm 755 "glab-component-generator" "$pkgdir/usr/bin/glab-component-generator"
}
