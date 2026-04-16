# Maintainer: Ivan 'Frostygames0' <frostygames0.aur@yandex.ru>
pkgname=mirea-aco-avrora-bin
pkgver=1.0.0
pkgrel=5
pkgdesc="ACO Avrora"
arch=('x86_64')
url="https://mirea.aco-avrora.ru/"
license=('unknown')
options=(!strip)
depends=(
	'qt5-webengine'
	'gcc-libs'
	'glibc'
)
optdepends=(
    'qt5-wayland: Qt 5 Wayland support'
    'kwayland5: Fixes incorrect cursor theme on KDE'
    'plasma5-integration: If you have weird issues on KDE, this might help as well'
)
source=("https://mirea.aco-avrora.ru/new/ARM_Student.tgz"
		'ARM_Student.desktop'
		'ARM_Student.png')
sha256sums=('a3ba523c29ee9c15ef725dc37b960a30d5eb6492ad3d05c84e6072edb28b9f56'
            '5bfa3f5237513cd7c262fe14a768d775a460ba7cee3987ae0e6fe0f8080bbec4'
            'd8a258a547bf79a17ca7f519e103a68d0a81b20e1f1fe09c061d81e74d8eae56')

package() {
  install -Dm755 "$srcdir/Student_ARM/data/ARM_Student" "$pkgdir/usr/bin/ARM_Student"
  install -Dm644 "$srcdir/ARM_Student.desktop" "$pkgdir/usr/share/applications/ARM_Student.desktop"
  install -Dm644 "$srcdir/ARM_Student.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/ARM_Student.png"
}
