# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=strace-parser-bin
pkgver=0.7.2
pkgrel=1
_tag=aeec995aa6d28ce0ddc5e8dab3952278
pkgdesc='Strace parser written in Rust'
arch=(x86_64)
url=https://gitlab.com/gitlab-com/support/toolbox/strace-parser
license=(MIT)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("$url/uploads/$_tag/${pkgname%-bin}_${pkgver//./-}_linux_musl.tar.gz")
sha256sums=('885dfc3ea2b5dcbef16a71c33ef992d858abd9a64a1dc59375f5d425e86b1a05')

package() {
  install -Dm755  "${pkgname%-bin}" "$pkgdir/usr/bin/${pkgname%-bin}"
}
