# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.0.4
pkgrel=2
pkgdesc="Personal information dashboard for your terminal"
arch=('x86_64')
url="https://wtfutil.com"
license=('MIT')
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/v${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('2ae5a288d2699cbbe8543615fc2b46a360a18566f40e8dc4ff49ceb07dd9cd12')

package(){
  install -D "${srcdir}/wtf" "${pkgdir}/usr/bin/wtfutil"
}
