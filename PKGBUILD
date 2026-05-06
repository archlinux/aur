# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-Maintainer: tee < teeaur at duck dot com >

pkgname="wstunnel-bin"
pkgver=10.5.5
pkgrel=1
pkgdesc="Tunnel all your traffic over websocket protocol - Bypass firewalls/DPI"
url="https://github.com/erebe/wstunnel"
license=("BSD-3-Clause")
arch=("x86_64" "aarch64" "armv7h")
provides=("wstunnel")
conflicts=("wstunnel" "nodejs-wstunnel")
source_x86_64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$url/releases/download/v$pkgver/wstunnel_${pkgver}_linux_armv7.tar.gz")
b2sums_x86_64=('fc00fcbf1446f7043c2626bb123c1d6c5b9b0dc16ea2f355262c6d46fc39805a9ccc9f661cd8f551c865325d35b0ec84c6092c327fe2e3df2338ade77633cfab')
b2sums_aarch64=('162bd56bbabd671a3f0496b70b86e69d2782450c43c062f99ad0577616f95f6ac088c1f46416ceff7b97d2689d7ae4666369057fb33306823851167350291023')
b2sums_armv7h=('529069b13b1fe792abc905cf9ce6ad32ae09dbf8e76d65b523dd3916b043df8142669a8f369aeae5c115fe9b6e581031646b9cb9be5936d6c603ce0cf5554185')
options=("!strip")

package(){
  install -Dm755 wstunnel  -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE   -t "$pkgdir/usr/share/licenses/wstunnel/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/wstunnel/"
}
