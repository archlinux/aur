# Maintainer: PharmaRacist
pkgname=noon-services
pkgver=2.0.0
pkgrel=1
pkgdesc="System services for Noon desktop environment"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')
depends=(
    'ananicy-cpp'
    'auto-cpufreq'
    'gammastep'
    'geoclue'
    'gnome-keyring'
    'kwallet'
    'networkmanager'
    'polkit-kde-agent'
    'sddm'
    'tlp'
    'upower'
    'wireplumber'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "System services for Noon" > "$pkgdir/usr/share/doc/$pkgname/README"
}
