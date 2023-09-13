_pkgname=ddns-go
pkgname=${_pkgname}
pkgver=5.6.2
pkgrel=1
pkgdesc='简单好用的DDNS。自动更新域名解析到公网IP(支持阿里云、腾讯云dnspod、Cloudflare、华为云)'
license=('MIT')
arch=('x86_64' 'i686' 'aarch64' 'armv6h')
url="https://github.com/jeessy2/${_pkgname}"
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.service)
source_x86_64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
source_armv6h=("https://github.com/jeessy2/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv6.tar.gz")
sha256sums=('c264ee5afaee8abed884cdd167f2e3281e08c3d74778790263163c114cd650d5')
sha256sums_x86_64=('853d60a72e998b81335891697a038a245e86f1a7f8a6682d2200f7544edcbda0')
sha256sums_i686=('0ec2c1d7646c0907d3a71d0665bb290583f4043f644722e3267d2c6228cb05ef')
sha256sums_aarch64=('2d4c1e10b6adfbc6e94fff8e3200fca1574f3538b0b5690be3e303b90c8279d8')
sha256sums_armv6h=('86a8ac7ca51c906ebab2b29f2e9eed5a4ec9cd34189864516cc430627710c735')
 
package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
