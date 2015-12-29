# Maintainer: 4679kun <4679kun@outlook.com> 
# Contributor: Peter Cai <xqsx43cxy@gmail.com> 
pkgname=net-speeder 
pkgver=git
pkgrel=1 
pkgdesc="A network optimizing tool for high-delay network environment (ROOT NEEDED)" 
url="https://github.com/snooda/net-speeder" 
arch=('x86_64' 'i686') 
license=('Unknown') 
depends=('libnet' 'libpcap') 
source=("git+https://github.com/snooda/net-speeder")
md5sums=('SKIP') 

build() { 
    cd "${srcdir}/net-speeder"&&sh build.sh 
} 

package() { 
    install -Dm755 "${srcdir}/net-speeder/net_speeder" "${pkgdir}/usr/bin/net-speeder" 
}
