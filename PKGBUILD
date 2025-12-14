pkgname=outertune
pkgver=1.0.0
pkgrel=1
pkgdesc="OuterTune-style YouTube Music desktop client"
arch=('x86_64')
url="https://aur.archlinux.org/packages/outertune"
license=('MIT')

depends=('webkit2gtk' 'libappindicator-gtk3' 'playerctl')

source=()
sha256sums=()

package() {
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/outertune" <<'EOF'
#!/bin/bash
echo "OuterTune Desktop coming soon"
EOF
}

