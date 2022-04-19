# Maintainer: Sam A. Horvath-Hunt <hello@samhh.com>

pkgname=diffsitter-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A tree-sitter based AST difftool to get meaningful semantic diffs"
url="https://github.com/afnanenayet/diffsitter"
provides=('diffsitter')
arch=('x86_64' 'i686' 'arm' 'aarch64')
license=('MIT')
source=("$url/archive/v$pkgver.tar.gz")
source_x86_64=("$url/releases/download/v$pkgver/diffsitter-x86_64-unknown-linux-gnu.tar.gz")
source_i686=("$url/releases/download/v$pkgver/diffsitter-i686-unknown-linux-gnu.tar.gz")
source_arm=("$url/releases/download/v$pkgver/diffsitter-arm-unknown-linux-gnueabihf.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/diffsitter-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('a669dd0437528a2be17bed6294c90fda5bda223f2a7cb9bb8b84933ab663bf31')
sha256sums_x86_64=('4ee8aea3ae3946c22808d65359d2f6253282a410a8db88e4371e852706d3831c')
sha256sums_i686=('a6943c8fa9e89fbeb9e8ba307925a3bdb9fd56c6e7f1b8659d95b790c368eff8')
sha256sums_arm=('ab5eb076a0593673dae1a872185a60c633420885fe9f097481c884c0b36ecac1')
sha256sums_aarch64=('f081d3ffc605c9f04012dc587df388edb06ea219ee884fef00fba85c91024e7d')

package() {
    install -Dm755 "$srcdir/diffsitter-$CARCH-unknown-linux-gnu/diffsitter" "$pkgdir/usr/bin/diffsitter"
    install -Dm644 "$srcdir/diffsitter-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/diffsitter/LICENSE"
}

