# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>
_base=cloud-nuke
pkgname=${_base}-bin
pkgver=0.53.0
pkgrel=1
pkgdesc="AWS cloud account cleaning tool"
url="https://github.com/gruntwork-io/${_base}"
arch=(x86_64 i386 aarch64)
license=(MIT)
conflicts=("${_base}")
provides=("${_base}")
source_x86_64=(${_base}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/${_base}_linux_amd64)
source_i386=(${_base}-${pkgver}-i386::${url}/releases/download/v${pkgver}/${_base}_linux_386)
source_aarch64=(${_base}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/${_base}_linux_arm64)
sha512sums_x86_64=('bd052e8bc7c9107ba71a8b9f4b78678b7a9a537bc85044ab3f36b1a1668952730aaf9634f2118cc46acf67a88db2735ab3a5bbec769836d2b275fbb407fea313')
sha512sums_i386=('223878aaaf0babf7883dc6677530811238929cad31955b7877bcac6db752314cdf30ec8b7940bebcf70ea8fe75839feae314038ccdb5c25536353fab0b816ada')
sha512sums_aarch64=('9c46f07ba97a9d43da23f51c56403c786466a0db6f6c00fb03fed68cc4bd592c63c80473ba881f86532bd3f6d17dce5be34dd2de99192338eb87d121700293d2')

package() {
  install -Dm755 ${_base}-${pkgver}-${CARCH} "$pkgdir/usr/bin/${_base}"
}
