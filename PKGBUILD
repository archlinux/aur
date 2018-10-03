# Maintainer: Bruno Inec <brunoinec at gmail dot com>
pkgname=wtfutil
pkgver=0.3.0
pkgrel=1
pkgdesc="Personal information dashboard for your terminal"
arch=(x86_64)
url="https://wtfutil.com"
license=(MIT)
source_x86_64=("https://github.com/senorprogrammer/wtf/releases/download/${pkgver}/wtf_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('3504830a10132399054b46fcb836dbebe68f5a5b0425e9fbdf634af17a697667')

package(){
  install -D "${srcdir}/wtf_${pkgver}_linux_amd64/wtf" "${pkgdir}/usr/bin/wtfutil"
}
