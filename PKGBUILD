# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ghtkn-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Create short-lived GitHub App user access tokens for local development"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/ghtkn"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ghtkn_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ghtkn_linux_arm64.tar.gz")
sha256sums_x86_64=('e451a18622995f9cca89a149d1d1d54e886c8656e9592adc512a60a522b18709')
sha256sums_aarch64=('8d7f539a0a924d7ea9873d180f8f13692252e762eb905959ad1c7b856290a1bb')

package() {
  install -Dm755 "ghtkn" "${pkgdir}/usr/bin/ghtkn"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/godbus/dbus/v5/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/lmittmann/tint/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-colorable/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-isatty/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/cobra/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/pflag/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/cobra-util/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/ghtkn-go-sdk/ghtkn/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/ghtkn/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-error-with-exit-code/ecerror/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-github-device-flow/deviceflow/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-revoke-github-access-token/revoke/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-error/slogerr/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-util/slogutil/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/zalando/go-keyring/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.design/x/clipboard/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.design/x/x11/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/crypto/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/oauth2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/sys/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/term/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/gopkg.in/yaml.v3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
