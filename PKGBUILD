# Maintainer: heinrich5991 <heinrich5991@gmail.com>
pkgname=volt
pkgver=0.80
pkgrel=3
pkgdesc="Fast native desktop client Slack"
arch=('x86_64')
url="https://volt-app.com/"
license=('unknown')
depends=(
  'glfw'
  'libcurl-compat'
)
options=('!strip')
source=("https://github.com/voltapp/volt/releases/download/${pkgver}/volt_linux.zip"
        "volt_wrapper")
sha256sums=('c3c6e933bb680feb6c55a304fd08a61d778f07625793a81bb33998b782aa6378'
            'SKIP')

package() {
  install -Dm755 volt_wrapper "${pkgdir}"/usr/bin/volt
  install -Dm755 volt "${pkgdir}"/usr/lib/volt/volt
  install -Dm644 RobotoMono-Regular.ttf "${pkgdir}"/usr/share/volt/RobotoMono-Regular.ttf
}
