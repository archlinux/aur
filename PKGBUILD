# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.8
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('07000f3e9d4e4dd8cf4f18d6f172ad7f56509fa7289e148179162d88d2373eb3')

package(){
  install -D "${srcdir}/wtf" "${pkgdir}/usr/bin/wtfutil"
}
