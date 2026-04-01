# Maintainer: Yast <yastcher@gmail.com>
pkgname=tapeback-diarize
pkgver=0.8.6
pkgrel=1
pkgdesc="Speaker diarization support for tapeback (pyannote + PyTorch)"
arch=('any')
url="https://github.com/yastcher/tapeback"
license=('Apache-2.0')
depends=('tapeback')
optdepends=('cuda: GPU-accelerated diarization')
install=tapeback-diarize.install

# Meta-package: dependencies installed via .install hook into /opt/tapeback/ venv.
# PyTorch wheels are ~2 GB and cannot be reasonably packaged as Arch packages.

package() {
    install -Dm644 /dev/stdin "$pkgdir/usr/share/doc/$pkgname/README" <<EOF
tapeback-diarize: speaker diarization support for tapeback.
Pip dependencies installed into /opt/tapeback/ venv by install hook.
EOF
}
