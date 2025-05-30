# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=qdiskinfo-bin
pkgver=0.4
pkgrel=2
pkgdesc="Frontend for smartctl providing a user experience similar to CrystalDiskInfo (binary release)"
url="https://github.com/edisionnano/QDiskInfo"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('hicolor-icon-theme' 'polkit' 'qt6-base' 'qt6-svg' 'smartmontools')
provides=("qdiskinfo")
conflicts=("qdiskinfo")
source=("QDiskInfo-$pkgver.desktop::$url/raw/refs/tags/$pkgver/dist/QDiskInfo.desktop"
        "QDiskInfo-$pkgver.png::$url/raw/refs/tags/$pkgver/dist/QDiskInfo.png"
        "QDiskInfo-256x256-$pkgver.png::$url/raw/refs/tags/$pkgver/dist/QDiskInfo-256x256.png"
        "QDiskInfo-$pkgver.svg::$url/raw/refs/tags/$pkgver/dist/QDiskInfo.svg"
        "QDiskInfo-$pkgver::$url/releases/download/$pkgver/QDiskInfo_X86_64")
sha256sums=('43d405391bbb18e58834ea180152d01bcf6df4f962771592a24234e0e6cfc6d5'
            '7c237bd42f38cd224b9d2fe2d09c6c1539bc52cd92cecf25a270cf0f52a18a33'
            '5753ab3e280390bc429bdcf3b3bd1f977a46df9c5e2a33f4ceef1529c82c96da'
            '1c9c03d8bf3dfa0b1b937c4070ab7db6edbe227081069c6426cf702647c0f32f'
            'b0859706094dce364d2a20333b3e720808123caa7b35840fd2c536196b5b4b45')

package() {
  install -Dm644 QDiskInfo-$pkgver.desktop "$pkgdir/usr/share/applications/QDiskInfo.desktop"
  install -Dm644 QDiskInfo-$pkgver.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/QDiskInfo.png"
  install -Dm644 QDiskInfo-256x256-$pkgver.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/QDiskInfo.png"
  install -Dm644 QDiskInfo-$pkgver.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/QDiskInfo.svg"
  install -Dm755 QDiskInfo-$pkgver "$pkgdir/usr/bin/QDiskInfo"
  ln -s QDiskInfo "$pkgdir/usr/bin/qdiskinfo"
  }
