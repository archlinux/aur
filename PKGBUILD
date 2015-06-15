# Maintainer: morning_star <livef3@aol.com>
# Thank you to Earnestly

pkgbase=mstar-gtk-themes-git
pkgname=('gtk-theme-acou-git' 'gtk-theme-boxtrot-git' 'gtk-theme-colby-git'
         'gtk-theme-fire-git' 'gtk-theme-ice-git' 'gtk-theme-oreo-git'
         'gtk-theme-jibbers-git' 'gtk-theme-plasma-git' 'gtk-theme-drib-git')
pkgver=r6.82b3efe
pkgrel=1

pkgdesc='morning_star gtk themes collection'
url='https://github.com/dreemsoul/gtk-themes'
arch=('any')
license=('GPL')

makedepends=('git')

source=('git://github.com/dreemsoul/gtk-themes')

md5sums=('SKIP')

pkgver() {
    cd gtk-themes
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_gtk-theme-acou-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership acou "$pkgdir"/usr/share/themes
}

package_gtk-theme-boxtrot-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership boxtrot "$pkgdir"/usr/share/themes
}

package_gtk-theme-colby-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership colby "$pkgdir"/usr/share/themes
}

package_gtk-theme-fire-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership fire "$pkgdir"/usr/share/themes
}

package_gtk-theme-ice-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership ice "$pkgdir"/usr/share/themes
}

package_gtk-theme-oreo-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership oreo "$pkgdir"/usr/share/themes
}

package_gtk-theme-jibbers-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership jibbers "$pkgdir"/usr/share/themes
}

package_gtk-theme-plasma-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership plasma "$pkgdir"/usr/share/themes
}

package_gtk-theme-drib-git() {
    cd gtk-themes/.themes
    install -dm755 "$pkgdir"/usr/share/themes
    cp -rp --no-preserve=ownership drib "$pkgdir"/usr/share/themes
}
