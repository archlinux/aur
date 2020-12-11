# Maintainer: ivan a.k.a. ratijas <me at ratijas dot tk>
pkgname=symlink-latest-kernel
pkgver=1.0
pkgrel=1
pkgdesc="Symlink latest kernel version in /usr/lib/modules"
arch=('any')
url="https://github.com/ratijas/symlink-latest-kernel"
license=('GPL2')
depends=(linux)
install=symlink-latest-kernel.install
source=(symlink-latest-kernel
        symlink-latest-kernel.hook
        symlink-latest-kernel.install)
sha512sums=('fc2c82ba06f901abe5cbcd119057b808cb7d6a290b0c7115bf88fb5ff610b35c211e924b5f481a026d44128c070cff0c47427fafc533521ccd87b4ba6169a1bf'
            '59ca3668127aa334dbd8aecd0c23bbad07135a9763413d015f66eb2b51147b41a8f7dfe12eba38c14fa7d1cd267b106b2012b1c09002e96df4f0d944fc51467b'
            'ce838e12b8b7e54e4c02449c48710cb5e1f58c06ae01edbe3ed37fa20b8b3e350a8024d2a71d1fa605a25122b59d16d4e38ad530db33c1e0d685ff1eda2db25e')

package() {
    install -Dm 755 "${srcdir}/symlink-latest-kernel"      "${pkgdir}/usr/share/libalpm/scripts/symlink-latest-kernel"
    install -Dm 644 "${srcdir}/symlink-latest-kernel.hook" "${pkgdir}/usr/share/libalpm/hooks/symlink-latest-kernel.hook"
}
