# Maintainer: ssprea

pkgname=ssprea-nvidia-control-git
pkgver=2.0.0
pkgrel=20
pkgdesc='Transitional package for the renamed slimit-gpu package'
arch=('any')
url='https://github.com/ssprea/slimit'
# If your previous PKGBUILD declared a license, keep that same license array here.
depends=('slimit-gpu-git')

package() {
  install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<'EOF_README'
This is a transitional package.

The project has been renamed to sLimit and the Arch package is now
called slimit-gpu-git. The slimit-gpu-git package is installed as a dependency.

You can safely remove this transitional package after migration.
EOF_README
}
