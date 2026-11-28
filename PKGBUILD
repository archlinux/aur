# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=github-comment-bin
pkgver=6.4.2
pkgrel=1
pkgdesc="Create and hide GitHub comments from the command line"
arch=('x86_64' 'aarch64')
url="https://github.com/suzuki-shunsuke/github-comment"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/github-comment_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/github-comment_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('d355c2c3d94a3170f46b89b3512d9624446c3d2206398f6567d1c2965fdd9cd5')
sha256sums_aarch64=('5965906371b487ab144eb754512ab4bfd4366946b0f9bf2623b17d200305feb7')

package() {
  install -Dm755 "github-comment" "${pkgdir}/usr/bin/github-comment"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/dario.cat/mergo/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/Masterminds/goutils/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/Masterminds/semver/v3/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/Masterminds/sprig/v3/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/bahlo/generic-list-go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/buger/jsonparser/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/expr-lang/expr/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-github/v93/github/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/go-querystring/query/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/google/uuid/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/huandu/xstrings/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/invopop/jsonschema/COPYING" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/lmittmann/tint/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-colorable/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mattn/go-isatty/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mitchellh/copystructure/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/mitchellh/reflectwalk/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/pb33f/ordered-map/v2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/shopspring/decimal/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/shurcooL/githubv4/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/shurcooL/graphql/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/afero/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/spf13/cast/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/github-comment-metadata/metadata/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/github-comment/v6/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-ci-env/v3/cienv/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/go-error-with-exit-code/ecerror/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-error/slogerr/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/slog-util/slogutil/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/suzuki-shunsuke/urfave-cli-v3-util/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/github.com/urfave/cli/v3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/go.yaml.in/yaml/v4/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/crypto/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/net/context/ctxhttp/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/oauth2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/sys/unix/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/term/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/golang.org/x/text/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "third_party_licenses/gopkg.in/yaml.v2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
