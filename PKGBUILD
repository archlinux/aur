# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=ghalint-bin
pkgver=1.6.0
pkgrel=1
pkgdesc="GitHub Actions linter"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/ghalint"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/ghalint_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/ghalint_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('eda1af79c1a4a31c2de5831cd1333ad582fa6fa72015f8e9c1c4525d550c1d35')
sha256sums_aarch64=('f9d8e20a75c934d21ee6ab1967eb79fa125237ef5633c6bfd03b27999c6a6cda')

package() {
  install -Dm755 "ghalint" "${pkgdir}/usr/bin/ghalint"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/adrg/xdg/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/charmbracelet/x/term/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/github/actions-lockfile/go/pkg/lockfile/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/godbus/dbus/v5/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-github/v93/github/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-querystring/query/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/lmittmann/tint/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-colorable/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-isatty/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/ghalint/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-error-with-exit-code/ecerror/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-error/slogerr/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-util/slogutil/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/urfave-cli-v3-util/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/urfave/cli/v3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/zalando/go-keyring/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/oauth2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/sys/unix/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/gopkg.in/yaml.v3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
