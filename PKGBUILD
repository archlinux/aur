# Maintainer: xhdndmm <xhdndmm@gmail.com>

pkgname=123pan-cli-bin
pkgver=1.1.2
pkgrel=1
pkgdesc="123pan-cli-bin"
arch=('x86_64')
url="https://github.com/123panNextGen/123pan-cli"
license=('MIT')

source=(
  "123pan-cli.zip::https://github.com/123panNextGen/123pan-cli/releases/download/v${pkgver}/123pan-cli-linux.zip"
)

sha256sums=('7cb84f6f9de990b461ca4a35d92941edf835c9bebd04d4d1681656d61be47dcc')

package() {
    install -dm755 "$pkgdir/usr/bin"

    cp "$srcdir/"123pan-cli \
          "$pkgdir/usr/bin/123pan-cli"
}
