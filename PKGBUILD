# Maintainer: Glucy2 <glucy-2@outlook.com>

_pkgname=nali-nt
pkgname=${_pkgname}-bin
pkgver="1.7.5"
pkgrel="1"
pkgdesc="集成了 NextTrace LEOMOEAPI 的 nali; 一个查询 IP 地理信息和 CDN 服务提供商的离线终端工具. An offline tool for querying IP geographic information and CDN provider. (Binary Package)"
arch=(
    "x86_64"
    "i686"
    "aarch64"
    "armv6h"
    "armv7h"
    "mips"
    "mipsel"
    "mips64"
    "mips64el"
    "mipsel"
    "ppc64"
    "ppc64le"
    "riscv64"
    "s390x"
)
url="https://nxtrace.github.io/nali/"
license=("MIT")
conflicts=("${_pkgname}")
provides=("${_pkgname}")

source_x86_64=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_amd64")
source_i686=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_386")
source_aarch64=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_arm64")
source_armv5tel=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_armv5")
source_armv6h=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_armv6")
source_armv7h=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_armv7")
source_mips=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_mips")
source_mipsel=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_mipsle")
source_mips64=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_mips64")
source_mips64el=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_mips64le")
source_ppc64=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_ppc64")
source_ppc64le=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_ppc64le")
source_riscv64=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_riscv64")
source_s390x=("nali-nt::https://github.com/nxtrace/nali/releases/download/v${pkgver}/nali-nt_linux_s390x")

sha256sums_x86_64=("d8e18e7e44eb644376f0209723bf2147b8e83b742e28292821e2381fafee09ae")
sha256sums_i686=("3d18b50c13b0dc4bf63407228ba74f31167b3a34fdd5294caba60c5fcde9b592")
sha256sums_aarch64=("195226bade773517323ed6e28dedfd7ef278b2b97906d838e951bee3d28ec838")
sha256sums_armv5tel=("1f6cc4b3aa6600a18f133c1e0f784148ff566b572650e8228473f35fc5d31776")
sha256sums_armv6h=("bbce30fdf99a2cc106c32a8421fe2fe132cb9672b7ef8afd731e3897ac65b17f")
sha256sums_armv7h=("689dff2c5a39683dea5fcd8f0e965b454770a15c3e00fff5d851b5667c9edfb7")
sha256sums_mips=("d09b981b78c3a5bfb84c2d973f334222e008c92b6c505cf0e77261218df202df")
sha256sums_mipsel=("8c9da418a7e12fb9d16d4da7997adc77ccb06134fe5541ad87fb666c92ba86b2")
sha256sums_mips64=("e20c22dff09a8b9c7cc0f489beba40e4176dcded5bb57de98c56c61efcd10a4a")
sha256sums_mips64el=("d864f202e3eda030b8a3329dea780ee4cff8b958acb42e1e80edc773ae28584d")
sha256sums_ppc64=("3e017b1dc531c0bc72c74c2a152113a78254d041cfbb472d0e9d51d27596887a")
sha256sums_ppc64le=("0078f3dfa33eddcbc7490e5566dec9cb960a7d08d6c0bf634617d1fa754b6af5")
sha256sums_riscv64=("368998ebabc4c21f9c6e5c4012b26141b7a17249e32dbcf19055092f4b39f7a3")
sha256sums_s390x=("0403e1aed70005088b49ce804a682715315e81c13c5903ad602925e64e70d3a1")

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 "./nali-nt" "${pkgdir}/usr/bin/"
}
