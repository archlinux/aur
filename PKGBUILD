# Maintainer: Ischa Abraham <contact@ischa.dev>
pkgname=passh-agent-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="An ssh-agent implementation to fetch your SSH keys from Pass."
url="https://github.com/MrPixelized/passh-agent"
license=("GPL3")
arch=("x86_64")
provides=("passh-agent")
options=("strip")
source=("https://github.com/MrPixelized/passh-agent/releases/download/v$pkgver/passh-agent-$pkgver-x86_64.tar.gz")
sha256sums=("9c6728f52640f5ffbaaa2b3ef8cb90647f4c5d0281362fe27082ae7bea1eaa86")

package() {
    install -Dm755 passh-agent -t "$pkgdir/usr/bin/"
}
