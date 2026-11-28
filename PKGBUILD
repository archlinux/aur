# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tfmv-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Rename Terraform resources and generate moved blocks"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/tfmv"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tfmv_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tfmv_linux_arm64.tar.gz")
sha256sums_x86_64=('40be2d87c8fa034438f327ec92bec205df8fe1118640e0884895c77627b42306')
sha256sums_aarch64=('74b041a0cc01b9c717e7dcc69c96905ae34398b5c7bdce49ce31ccdc4aad0cbc')

package() {
  install -Dm755 "tfmv" "${pkgdir}/usr/bin/tfmv"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/agext/levenshtein/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/apparentlymart/go-textseg/v17/textseg/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-cmp/cmp/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-jsonnet/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/hashicorp/hcl/v2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/lintnet/go-jsonnet-native-functions/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/lmittmann/tint/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-colorable/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-isatty/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/minamijoyo/hcledit/editor/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mitchellh/go-wordwrap/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/afero/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/pflag/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-error/slogerr/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-util/slogutil/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/tfmv/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/zclconf/go-cty/cty/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/crypto/sha3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/sys/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/text/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/sigs.k8s.io/yaml/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/sigs.k8s.io/yaml/goyaml.v2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
