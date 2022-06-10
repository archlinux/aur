# Maintainer: Anthony Wang <ta180m@proton.me>
pkgname=precompile-bits-stdc++.h
pkgver=1.0.0
pkgrel=1
pkgdesc="Precompiles the bits/stdc++.h header file useful for competitive programming"
arch=(any)
url="https://aur.archlinux.org/packages/precompile-bits-stdc++.h"
license=('GPL')
depends=('gcc')
source=("precompile-bits-stdc++.h.hook"
        "remove-precompiled-bits-stdc++.h.hook")
sha256sums=('572d1ba766e1cb5bee6c29d3f8ec55b87ca5184bd68e207c518be946c87e77ef'
            '9e83d042097d5b6967874a2d0b5fc3315cfd689541597c71c0cd3ae0ecd01f23')

package() {
	install -Dm 644 precompile-bits-stdc++.h.hook "$pkgdir/usr/share/libalpm/hooks/precompile-bits-stdc++.h.hook"
	install -Dm 644 remove-precompiled-bits-stdc++.h.hook "$pkgdir/usr/share/libalpm/hooks/remove-precompiled-bits-stdc++.h.hook"
}
