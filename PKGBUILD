# Maintainer: Carson Rueter <bottomtext97@gmail.com>
pkgname='cachetools'
pkgver=1.0.0  
pkgrel=1
pkgdesc="A set of useful tools for managing and clearing cache."
arch=('any')
url="https://github.com/binex-dsk/linux-cache-tools"
license=('GPL3')
provides=('cachetools-clear' 'cachetools-config' 'cachetools-find' 'cachetools-man' 'cachetools-mem')
source=("git+https://github.com/binex-dsk/linux-cache-tools.git")
md5sums=('SKIP')

package() { 
        for i in `ls cachetools*`; do
            install -Dm644 "$i" "${pkgdir}/usr/bin/`basename '$i'`"
        done
}
