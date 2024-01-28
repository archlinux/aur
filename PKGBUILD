# Contributor: Hao Long <aur@esd.cc>

pkgname=ksubdomain-bin
pkgver=1.9.5
pkgrel=1
pkgdesc="无状态子域名爆破工具"
arch=("x86_64")
url="https://github.com/boy-hack/ksubdomain"
license=("MIT")
depends=(glibc)
install=.install
source=("https://github.com/boy-hack/ksubdomain/releases/download/v$pkgver/KSubdomain-v$pkgver-linux.tar"
	https://raw.githubusercontent.com/boy-hack/ksubdomain/504cb1b053bb131dc890ddbe7be3296df6930d97/LICENSE)
b2sums=('019f58834018bdaff4231f27ca5654e34a5cf08bb0495bf737bcf26289feb948a01fddcc9f1c52423c39fbbe8cd24bfee9fbe9fe4257c50d45221401de3ee119'
        '773295e0bf7dacf24b0a1750b10acb1c82d1bf7cfa40289b3c5f4e3a0969e3c15106cd04b8b16c536d5ff2d7949ef861df408ed9b8a937ae1e189a70f21b5304')

package() {
	install -vDm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
	install -vDm755 ksubdomain -t ${pkgdir}/usr/bin/
}
