# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.2.1
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=(x86_64)
url="https://wtfutil.com"
license=(MIT)
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('6c7b22f8590041c1fcc6e66ba2bab07b5fdafd98853860aae7b8f7374668f6a1')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtf" "${pkgdir}/usr/bin/wtfutil"
}
