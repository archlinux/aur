# Maintainer: li <lcj211@aihlp.com>

pkgname=lcj
pkgver=1.0.0
pkgrel=43
pkgdesc="All tools for Lcj"
#url="https://gitlab.com/corectrl/corectrl"
license=('GPL3')
arch=('any')
depends=('systemd-kexec' 'systemd-godns' 'git-tools' gfwlist-route  pkgfile systemd-autossh
systemd-wol
archlinuxcn-keyring
archlinuxcn-mirrorlist
devtools
firewalld-service

)
#makedepends=('cmake>=3.3' 'qt5-tools' 'karchive' 'gcc>=8' 'extra-cmake-modules')
optdepends=(
	'pkgbuild-introspection: For mksrcinfo'


)
#source=("https://gitlab.com/corectrl/corectrl/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
source=(
ipmac
makesrcinfo
pullall
pushall
fetchall
pppoecheck
pppoecheck.service
pppoecheck.timer
check-file-exists
compare-file-by-sha512
savegitignore
saveaur
mkmvngitignore
mkuefi
mkbiosvda
wgcheck
wgcheck.service
wgcheck.timer
kill-port

 reflectorall
        reflectorcn
        reflectorus
  file-ntospace
        file-spaceton
peers.conf
docker-list-tags

)

sha512sums=('8183dfdf382991ce1c686c7138290e0113d336436ffa5b60e0671eedbe43c90167b325dd237b1f6054d19695fc3f533beb2d3ac863f831379819a9de81933fbd'
            '75978d30a68de00cb50c23ba882dd73d9f365497025aacc271375249e7dd4aaff34732ced2ed1cbf2fc64fc3421b2fefc2ec64b16ef068e40d4343894b8c8bfb'
            '7fa56ac8779f4c3695f2ef2d4c86a35cc33ccdfa60a2f97665bf542dbca6381c70b16b94d0a67661ba0915b94c9a38b8706a81fdb970ec89fe377f7f92cb2075'
            '65c673c0ee9e351fe04decce6a0997360ded0b9804f6e9d8509fb7654ed9dc7bc71f18781c905403baf7a5fc44c24c6bfc17f46e79b3709747ba64850bd7c0b6'
            '89931a1582d1a472e71f4869af98171f0ca33d9e82a0dae00d76243ffbed2e4f34be1d8dd656b1b4f16d91f0ee57b10b416ff392dae9f6288747808e1df9a4ea'
            'a0603b1a51571f5308e228ae02fdfa30bfa0c8d989f137aeee223b585ff8a6ffd5cc738de92494a8a9b13e62f6e8f28da112aed229d4a5ab8e2a79cfb812fbbc'
            'b0cddef03746a5b8c2ca6be899a7e63fc25e2bbbd743f4a3566a4b4e1dd71419b3010f0dd16b80b5d943fab2b37ef1dae8819006ed916cba3a51960deb2a7696'
            '29fc3a014cf6fd4babf1c21ffcffd2a7c891a5dc4e6399788f9994a2a26496bd40b78579df314aaedc4918e78c2e1bb097a93fd358afa69e6f322b080525353a'
            '5b0340e455bdd1dcb960e6d5d57e2194c6a60e21da70bf9ed37bd22662866eb918ac5a8801ab5020b596261301d267800dfd3387abab2f69bb650c0f49362592'
            'e11f0a4ef4cd6e534f2778a44c2ad988d1032fa4b01d57debe563d7f4e4cb5ba1e7f1123fc6f6d53ad3b81ada063a585332ffb7368ca4c8f4b6cc90e5b537033'
            '966811ad453d6db13a51c294504e8ed0c6a0ffe2cdff756cfa88fb22b2998de8228cd2265c2eaab8ae01116531412831d06b1b9bf54af4b8b09bb065e3771816'
            '83a7a5d5408590eb94e009493a9b1521cd6d948399d7b1b4d7e812ef9b2f9ee831573e066181a07cc3fed4dd43e3e95fed55a55e0518f40751e9097f5767a372'
            '97ac6b71f77219f74d6f02cac7c5eb4e4e0a68074d0d972107d35127daf4f4804e7e6cd07591ae15b8a50b520e24970fa7945e440b324cfd4dd1301f8d71dc81'
            '4a1553a27e259da06eead3070449bea1469a431db60b7da4044f261ce7146e4de33be8938f060d6a763d79875cab526967d5823c5d6df971262519105cfece67'
            '5da2acfdd1d0c3334694b052c9f9bf7738c1ad35c8f26a0ce3ab287996f132fb1ab6e349def8c52afc1719161b188dce5ec9735687ec894bb671dfa66ed776d2'
            '0105f9fe7f324b4e0f881c86ee7c4139fac1662174bcef4364d619ea10cc0d3834d32a151e766d5b187a3f99f20588e8a5b4c71da189ac457b717a9d11947b36'
            '48ae9bfaf442595afda4ab52ac288f6ff1361c04316a58cf93c340539375acbdb7e4284ca3254fdff38660c757eb8f53be06e63e9a81e598d52d79f0a09c5bad'
            'a00127e2ff7ba71a9d52c1cb0fe454c5e4bbc076b69e1ce2e5dcf1abd28518f8e8514ee25002afaa262353688aff4578de639275681a717803034aa347240c81'
            'cf1ba08cf593d6619cb17870850ef13379ee750799c334d1bc9c6456464823ab851ab17a527e8caadeb4e0d01391af6f0ef18f77f6aece733f5bf23a0062f06a'
            '6d8ab59d8787c89b179bbee99b8a1977c94763763c9df488dc1a9fa433b2e47d053583fa319a6ee110af555b3d28faa384cf8dfd5b5c0eb358c2b78e2997fe4c'
            '06f5de6b3c5c52dcdaffc67a306dfa9c2a0194bebd8d806ea1dc8c31ef7fd4edbbc9d28b8e8eed949092c107e1e39b646fa3f2727f0b31963a469815a2497223'
            '546fbc05717b59e6fca0d99b189c01abc1030b66ccc4b2beead0ea01e1e92efda83ed5b5daa53ceefebcfbff0e781696c6b0d26adbca1f7a3fa8f9180aaef6aa'
            'a25a51bd0aec369d741db960227a36e06e0acfe5d801d4d83a463b31b2fd3bb071794d5c550b5267417e6d81d9a003171aca1ac09608325a9e9c31ae03fcb985'
            'bc770db134d0f8ead799ed0f56cb27593771ce5b3921db6e10df62ae95dea846b5140c866b9cb0823242e77e97120d98a5621bf321fa6362b3b1bf58ebc59b24'
            '15ea9fa9f111c180b37fa564ee796102ddf90df54c09a159ea8bbc8dc647b2d2a7b10be7589f6f37a6f7c49e37e75ff07c0dca74bacf4377db932d0950b58eff'
            '3b543f266e82c2d33474374c708f21d96949a9255bf1a3b194d57da592dcac1343edd968db2414ffd7fd042e94f4307b6ad0f70dd2af1c5a0fc3735d86d144c7')

















#Package files should follow these general directory guidelines:
#/etc	System-essential configuration files
#/usr/bin	Binaries
#/usr/lib	Libraries
#/usr/include	Header files
#/usr/lib/{pkg}	Modules, plugins, etc.
#/usr/share/doc/{pkg}	Application documentation
#/usr/share/info	GNU Info system files
#/usr/share/man	Manpages
#/usr/share/{pkg}	Application data
#/var/lib/{pkg}	Persistent application storage
#/etc/{pkg}	Configuration files for {pkg}
#/opt/{pkg}	Large self-contained packages


#build() {
 # rm -rf build
 # cmake -B build -S "$pkgname-v$pkgver" \
 # -DCMAKE_INSTALL_PREFIX=/usr \
 # -DBUILD_TESTING=OFF \
 # -Wno-dev
 # make -C build:

#}

package() {
# make -C build DESTDIR="$pkgdir" install
install  -dm755   "$pkgdir/etc/systemd/system"
install  -Dm755 ipmac  "$pkgdir/usr/bin/ipmac"
install  -Dm755 pushall  "$pkgdir/usr/bin/pushall"
install  -Dm755 pullall  "$pkgdir/usr/bin/pullall"
install  -Dm755 fetchall  "$pkgdir/usr/bin/fetchall"
install  -Dm755 wgcheck  "$pkgdir/usr/bin/wgcheck"
install  -Dm755 makesrcinfo  "$pkgdir/usr/bin/makesrcinfo"
install  -Dm644  pppoecheck.service  "$pkgdir/usr/lib/systemd/system/pppoecheck.service"
install  -Dm644  wgcheck.service  "$pkgdir/usr/lib/systemd/system/wgcheck.service"
install  -Dm644  pppoecheck.timer  "$pkgdir/usr/lib/systemd/system/pppoecheck.timer"
install  -Dm644  wgcheck.timer  "$pkgdir/usr/lib/systemd/system/wgcheck.timer"
install  -Dm755  pppoecheck  "$pkgdir/usr/lib/$pkgname/pppoecheck"
install  -Dm755 check-file-exists  "$pkgdir/usr/bin/check-file-exists"
install  -Dm755 compare-file-by-sha512  "$pkgdir/usr/bin/compare-file-by-sha512"
install  -Dm755 savegitignore  "$pkgdir/usr/bin/savegitignore"
install  -Dm755 saveaur  "$pkgdir/usr/bin/saveaur"
install  -Dm755 mkmvngitignore  "$pkgdir/usr/bin/mkmvngitignore"
install  -Dm755 mkuefi  "$pkgdir/usr/bin/mkuefi"
install  -Dm755 mkbiosvda  "$pkgdir/usr/bin/mkbiosvda"
install  -Dm755 kill-port  "$pkgdir/usr/bin/kill-port"
install  -Dm755 docker-list-tags  "$pkgdir/usr/bin/docker-list-tags"
install  -Dm644 peers.conf  "$pkgdir/etc/wireguard/peers.conf"

}

groups=('lcj')

