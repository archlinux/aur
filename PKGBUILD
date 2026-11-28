# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=tutor-mcp-bin
pkgver=0.7.6
pkgrel=1
pkgdesc="MCP server that turns any LLM into an intelligent tutoring system"
arch=('x86_64' 'aarch64')
url="https://github.com/ArnaudGuiovanna/tutor-mcp"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/tutor-mcp_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/tutor-mcp_linux_arm64.tar.gz")
sha256sums_x86_64=('c5f583b37d9508f049e2599354912b687bbde3849caf24dddafb535a507646f9')
sha256sums_aarch64=('e9d3bf94dd38c5cd76eb0068314e5e5c064f4bf21fba0d5623ca3d51a4798866')

package() {
  install -Dm755 "tutor-mcp" "${pkgdir}/usr/bin/tutor-mcp"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__btcsuite__btcd__btcec__v2@v2.5.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__btcsuite__btcd__chainhash__v2@v2.0.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__cenkalti__backoff__v5@v5.0.3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__cespare__xxhash__v2@v2.3.0/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__decred__dcrd__crypto__blake256@v1.1.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__decred__dcrd__dcrec__secp256k1__v4@v4.4.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__dustin__go-humanize@v1.0.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__felixge__httpsnoop@v1.1.0/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__go-logr__logr@v1.4.4/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__go-logr__stdr@v1.2.2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__golang-jwt__jwt__v5@v5.3.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__google__jsonschema-go@v0.4.3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__google__uuid@v1.6.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__grpc-ecosystem__grpc-gateway__v2@v2.30.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__jackc__pgpassfile@v1.0.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__jackc__pgservicefile@v0.0.0-20240606120523-5a60cdf6a761/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__jackc__pgx__v5@v5.11.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__jackc__puddle__v2@v2.2.2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__modelcontextprotocol__go-sdk@v1.8.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__remyoudompheng__bigfft@v0.0.0-20230129092748-24d4a6f8daec/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__robfig__cron__v3@v3.0.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__segmentio__asm@v1.1.3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__segmentio__encoding@v0.5.4/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/github.com__yosida95__uritemplate__v3@v3.0.2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__auto__sdk@v1.2.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__contrib__instrumentation__net__http__otelhttp@v0.71.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__exporters__otlp__otlpmetric__otlpmetrichttp@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__exporters__otlp__otlptrace@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__exporters__otlp__otlptrace__otlptracehttp@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__metric@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__sdk@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__sdk__metric@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__otel__trace@v1.46.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go.opentelemetry.io__proto__otlp@v1.11.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/src/crypto/internal/boring/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/src/vendor/golang.org/x/crypto/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/src/vendor/golang.org/x/net/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/src/vendor/golang.org/x/sys/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/src/vendor/golang.org/x/text/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__crypto@v0.58.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__net@v0.62.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__oauth2@v0.36.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__sync@v0.24.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__sys@v0.49.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__text@v0.43.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/golang.org__x__time@v0.15.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/google.golang.org__genproto__googleapis__api@v0.0.0-20260819154853-08b0e4226688/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/google.golang.org__genproto__googleapis__rpc@v0.0.0-20260819154853-08b0e4226688/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/google.golang.org__grpc@v1.83.2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/google.golang.org__protobuf@v1.36.12/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/gopkg.in__yaml.v3@v3.0.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__libc@v1.75.6/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__libc@v1.75.6/LICENSE-3RD-PARTY.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__mathutil@v1.7.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__memory@v1.12.1/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__memory@v1.12.1/LICENSE-GO" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__memory@v1.12.1/LICENSE-LOGO" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__memory@v1.12.1/LICENSE-MMAP-GO" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__sqlite@v1.58.0/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__sqlite@v1.58.0/LICENSE-SQLITE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/modernc.org__sqlite@v1.58.0/LICENSE-SQLITE_VEC" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "THIRD_PARTY_NOTICES/components/go@go1.26.11/lib/time/README" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
