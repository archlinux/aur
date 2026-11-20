# Maintainer: ParticleG <particle_g@outlook.com>
# SPDX-License-Identifier: 0BSD

pkgname=hypergryph-launcher-dwproton
pkgver=1.6.0.1601
pkgrel=1
pkgdesc='Unofficial DWProton integration for the official Hypergryph Launcher'
arch=('x86_64')
url='https://launcher-web.hypergryph.com/'
license=('0BSD')
depends=('bash' 'coreutils' 'curl' 'dwproton-bin')
optdepends=('libnotify: desktop error notifications')
source=(
  'hypergryph-launcher-dwproton'
  'hypergryph-launcher-dwproton.desktop'
  'LICENSE'
)
sha256sums=(
  '50be91ad06fe736e71cf6f615f14f3dca423169c3fd3425987b9fa97af5fc5eb'
  '6ee4721a75a608651db512570c052fde5f072f45c961293eb0817bf82f59e47b'
  'e43689ed5dbd460be77c4f8ecc14a1285671194f11f711520a7be8d8d6d847f7'
)

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
