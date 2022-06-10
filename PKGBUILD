# Maintainer: Anthony Wang <ta180m@proton.me>
pkgname=precompile-bits-stdc++.h
pkgver=1.1.1
pkgrel=1
pkgdesc="Precompiles the bits/stdc++.h header file useful for competitive programming"
arch=(any)
url="https://aur.archlinux.org/packages/precompile-bits-stdc++.h"
license=('GPL')
depends=('gcc')
source=("precompile-bits-stdc++.h.hook"
        "remove-precompiled-bits-stdc++.h.hook")
sha256sums=('be91217bbd00135dd2c217cdc067ef9accefc1c5fcb3462ad4a18f7a06e31189'
            '9449ef810eef66f5ef85686ed5cd480346a6b6fd1b91e98fd4fdc26522f789b1')

package() {
	install -Dm 644 precompile-bits-stdc++.h.hook "$pkgdir/usr/share/libalpm/hooks/precompile-bits-stdc++.h.hook"
	install -Dm 644 remove-precompiled-bits-stdc++.h.hook "$pkgdir/usr/share/libalpm/hooks/remove-precompiled-bits-stdc++.h.hook"
}
