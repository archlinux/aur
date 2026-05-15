# Maintainer: pngdeity <pngdeity@tutanota.com>

pkgname=conftest-bin
_pkgname=conftest
pkgver=0.68.2
pkgrel=1
pkgdesc='A utility to help you write tests against structured configuration data'
arch=('x86_64')
url='https://github.com/open-policy-agent/conftest'
license=('Apache')
source_x86_64=(
  "https://github.com/open-policy-agent/conftest/releases/download/v${pkgver}/conftest_${pkgver}_Linux_x86_64.tar.gz"
  "https://raw.githubusercontent.com/open-policy-agent/conftest/refs/tags/v${pkgver}/LICENSE"
)
sha256sums_x86_64=(
  'e8144c6d6d2ae0260b869caa60c7c262a1f95ac63ec1e5d2fb19be452d606347'
  'a3fc6a99a82b59b761a6b1aabe8fc540b7046d5f91377fc1d8897dbbf3bd18ac'
)
provides=('conftest')
conflicts=('conftest')

package() {
  install -Dm755 conftest "$pkgdir/usr/bin/conftest"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
