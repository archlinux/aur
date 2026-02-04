# Maintainer : Kirill Shakirov

pkgname=kira-blk-settings
pkgver=1.0.0
pkgrel=1
pkgdesc="Config to make VFS work more adequate, especially with USB Flash drives."
arch=('any')
license=('GPL3')
url="https://github.com/Kira-Linux/arch_pkgbuilds"

source=(
    '66-kira-vfs.conf'
    '60-kira-ioschedulers.rules'
)

sha384sums=('cc9dc6b94e371eb4419d4c00e46f52cd1d08fc64baf58e1388eb86bb9988aec2f83d03f49ee8921499172a53febe1ea2'
            'f98fb6e2577bccb525c991ca83a204e623f2b1798dcca6a983eed30b0ba02fccf61555e35a795cf2ff77b95a0b2df6c8')

package() {
    install -Dm0644 "$srcdir/66-kira-vfs.conf"   "$pkgdir/etc/sysctl.d/66-kira-vfs.conf"
    install -Dm0644 "$srcdir/60-kira-ioschedulers.rules"   "$pkgdir/etc/udev/rules.d/60-kira-ioschedulers.rules"
}
