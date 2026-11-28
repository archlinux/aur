# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=access-log-exporter-bin
pkgver=0.5.2
pkgrel=1
pkgdesc="Prometheus exporter that turns nginx syslog access logs into metrics"
arch=('x86_64' 'aarch64')
url="https://github.com/jkroepke/access-log-exporter"
license=('Apache-2.0')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.xz::${_dl}/access-log-exporter_${pkgver}_linux_amd64.tar.xz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.xz::${_dl}/access-log-exporter_${pkgver}_linux_arm64.tar.xz")
sha256sums_x86_64=('ca9855cb442aefea3eaa2fc31c7c46949525d94e62d31d6df524bf44878ea434')
sha256sums_aarch64=('6e393d69623768e70046ffa677206b40e96fd50f72ec4b51d2b6d9d6954fcf12')

package() {
  install -Dm755 "access-log-exporter" "${pkgdir}/usr/bin/access-log-exporter"
  install -Dm644 "3rdpartylicenses/github.com/KimMachineGun/automemlimit/memlimit/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/beorn7/perks/quantile/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/cespare/xxhash/v2/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/hashicorp/golang-lru/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/jkroepke/access-log-exporter/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/munnerz/goautoneg/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/pbnjay/memory/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/prometheus/client_golang/internal/github.com/golang/gddo/httputil/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/prometheus/client_golang/prometheus/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/prometheus/client_model/go/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/prometheus/common/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/prometheus/procfs/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/ua-parser/uap-go/uaparser/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/go.yaml.in/yaml/v4/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/golang.org/x/sys/unix/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/google.golang.org/protobuf/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/gopkg.in/yaml.v3/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "3rdpartylicenses/github.com/hashicorp/golang-lru/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
