# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=cbfmt-bin
pkgver=0.2.0
pkgrel=0
pkgdesc='A tool to format codeblocks inside markdown and org documents.'
arch=('x86_64')

url='https://github.com/lukas-reineke/cbfmt'
license=('MIT')
source=("cbfmt-$pkgver::https://github.com/lukas-reineke/cbfmt/releases/download/v${pkgver}/cbfmt_linux-x86_64_v${pkgver}.tar.gz")

depends=()

provides=(cbfmt)
conflicts=(cbfmt)

package() {
  install -Dm 755 "$srcdir/cbfmt_linux-x86_64_v$pkgver/cbfmt" "$pkgdir/usr/bin/cbfmt"
}

sha256sums=('fd13693ef6113b1b15d2a09d815dc5dff2906503e8cdb216e68b932d478d1ad2')
