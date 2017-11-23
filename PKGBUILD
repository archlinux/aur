# Maintainer: Haochen Tong <i at hexchain.org>

pkgname=cloudflare-warp
pkgver=2017.11.1
pkgrel=1
pkgdesc="Cloudflare Warp exposes applications running on your local web server, on any network with an Internet connection"
url="https://warp.cloudflare.com/"
license=("custom")
arch=('x86_64')
depends=("glibc")
source=("https://bin.equinox.io/c/2ovkwS9YHaP/warp-stable-linux-amd64.tgz"
        LICENSE.cloudflare-warp)

package() {
    cd "$srcdir"
    install -Dm755 cloudflare-warp -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE.cloudflare-warp "$pkgdir/usr/share/licenses/cloudflare-warp/LICENSE"
}

sha256sums=('24f3e583e6e0079adc176022091a9e1f0424017d1f7be881efedeb00b22c8f1b'
            'SKIP')
