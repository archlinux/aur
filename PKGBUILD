# Maintainer: PharmaRacist
pkgname=noon-apps
pkgver=2.0.0
pkgrel=1
pkgdesc="Applications for Noon desktop environment"
arch=('any')
url="https://github.com/PharmaRacist/Noon"
license=('MIT')

depends=(
    'ark'
    'bluedevil'
    'foot'
    'kdialog'
    'nm-connection-editor'
    'pavucontrol-qt'
    'plasma-nm'
    'playerctl'
    'qalculate-qt'
    'systemsettings'
    'vlc'
    'quickshell'
    'wf-recorder'
)

package() {
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"
    echo "Applications for Noon desktop environment" > "$pkgdir/usr/share/doc/$pkgname/README"
}
