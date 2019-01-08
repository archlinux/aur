# Maintainer: Bruno Inec <bruno at inec dot fr>
pkgname=wtfutil
pkgver=0.4.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=(x86_64)
url="https://wtfutil.com"
license=(MIT)
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('1d2aa742f91e9b930d1fbf49278d1b10ac5a3670adca41a3648b757a7576f6fb')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtf" "${pkgdir}/usr/bin/wtfutil"
}
