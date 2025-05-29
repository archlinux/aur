# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=qdiskinfo-bin
pkgver=0.4
pkgrel=1
pkgdesc="Frontend for smartctl providing a user experience similar to CrystalDiskInfo (binary release)"
url="https://github.com/edisionnano/QDiskInfo"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=('hicolor-icon-theme' 'polkit' 'qt6-base' 'qt6-svg' 'smartmontools')
provides=("qdiskinfo")
conflicts=("qdiskinfo")
source=("$url/raw/refs/tags/$pkgver/dist/QDiskInfo.desktop"
        "$url/raw/refs/tags/$pkgver/dist/QDiskInfo.png"
        "$url/raw/refs/tags/$pkgver/dist/QDiskInfo-256x256.png"
        "$url/raw/refs/tags/$pkgver/dist/QDiskInfo.svg"
        "$url/releases/download/$pkgver/QDiskInfo_X86_64")
sha256sums=('0c5a2436b6777f7871466d85dcc4ce880b597ec112c79991c9cf6a59a428895b'
            '7c237bd42f38cd224b9d2fe2d09c6c1539bc52cd92cecf25a270cf0f52a18a33'
            '5753ab3e280390bc429bdcf3b3bd1f977a46df9c5e2a33f4ceef1529c82c96da'
            'f7232af27f88d2ca36c46abebc272976b8e9aa91c7b00c1ae6635c53f09746c6'
            'b0859706094dce364d2a20333b3e720808123caa7b35840fd2c536196b5b4b45')

package() {
  ln -s QDiskInfo "$pkgdir/usr/bin/qdiskinfo"
  install -Dm644 QDiskInfo.desktop "$pkgdir/usr/share/applications/qdiskinfo.desktop"
  install -Dm644 QDiskInfo.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/QDiskInfo.png"
  install -Dm644 QDiskInfo-256x256.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/QDiskInfo.png"
  install -Dm644 QDiskInfo.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/qdiskinfo.svg"
  install -Dm755 QDiskInfo_X86_64 "$pkgdir/usr/bin/QDiskInfo"
  }
