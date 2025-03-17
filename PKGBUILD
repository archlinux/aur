# Maintainer: omjadas <omjadas at gmail dot com>

pkgname=amazon-ec2-instance-selector-bin
_realname="${pkgname%-bin}"
pkgver=3.1.1
pkgrel=1
pkgdesc="A CLI tool and go library which recommends instance types based on resource criteria like vcpus and memory"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/aws/${_realname}"
license=("Apache")
provides=("ec2-instance-selector")
conflicts=("${_realname}")
source_x86_64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-amd64.tar.gz")
source_aarch64=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm64.tar.gz")
source_armv7h=("https://github.com/aws/${_realname}/releases/download/v${pkgver}/ec2-instance-selector-linux-arm.tar.gz")
sha256sums_x86_64=('f174062b6d6d8acfadcc3355e94ca06e6cf81c07b5bfeee7693d2f878947cb2f')
sha256sums_aarch64=('ef0de3146041436447cb0718efb386e41f68b0d2d5399d16595c06db48837db2')
sha256sums_armv7h=('756de41d30803363660e3ba5bbc076ce8b738446f862c3aefa7bf58056dceb93')

package() {
  cd "${srcdir}/"
  install -Dm755 "ec2-instance-selector" "${pkgdir}/usr/bin/ec2-instance-selector"
}
