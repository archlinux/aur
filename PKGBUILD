# caelestia-shell

# Maintainer: Soramane <soramane32 at gmail dot com>

pkgname='caelestia-shell'
pkgver=1.0.0
pkgrel=1
pkgdesc='The desktop shell for the Caelestia dotfiles'
arch=('x86_64')
url='https://github.com/caelestia-dots/shell'
license=('GPL-3.0-only')
depends=('caelestia-cli' 'quickshell-git' 'ddcutil' 'brightnessctl' 'app2unit' 'cava' 'networkmanager'
         'lm_sensors' 'fish' 'aubio' 'libpipewire' 'glibc' 'gcc-libs' 'ttf-material-symbols-variable' 'power-profiles-daemon'
         'ttf-rubik-vf' 'ttf-cascadia-code-nerd' 'grim' 'swappy' 'libqalculate' 'bash' 'qt6-base' 'qt6-declarative')
provides=($pkgname)
conflicts=($pkgname)
_archive="$pkgname-$pkgver"
source=("$_archive.tar.gz::$url/releases/download/v$pkgver/$_archive.tar.gz")
sha256sums=('SKIP')

package() {
	cd "${srcdir}/${_archive}"

	cp -r ./* "$pkgdir"/
    install -Dm644 etc/xdg/quickshell/caelestia/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
