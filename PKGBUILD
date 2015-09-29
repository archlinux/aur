# Maintainer: t3kk3n <corp [at] hush [dot] ai>

## Just to note - The version will match backports-patched 

_p1="50-1-mac80211.compat08082009.wl_frag+ack_v1.patch"
_p2="60-1-compatdrivers_chan_qos_frag.patch"
_p3="70-1-fix-channel-negative-1.patch"

pkgname=backports-patches-git
pkgver=4.2_rc1
pkgrel=1
pkgdesc="frag+ack, chan_qos_frag, and chan-neg-1 patches for backports-patched."
url="https://backports.wiki.kernel.org/index.php/Main_Page"
arch=('any')
license=('GPL')
source=("50-1-mac80211.compat08082009.wl_frag+ack_v1.patch"
		"60-1-compatdrivers_chan_qos_frag.patch"
		"70-1-fix-channel-negative-1.patch")
sha256sums=('aa31eb472ad45a5d731d81883172d16a61796e81d0bbac1f7eb5770d3f452869'
			'ae81b9a3b68bd89caf2d21834f40089ba9b786e09d74e3f094acdbecdc38767b'
			'642742930215db30b7ac8ea2318b9428d8c7a1989b2c8452703f8fbf0b9e41ae')

package() {
  install -d "${pkgdir}"/etc/makepkg.d/backports-patched/patches
  install -m0644 "${srcdir}/${_p1}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p1}
  install -m0644 "${srcdir}/${_p2}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p2}
  install -m0644 "${srcdir}/${_p3}" "${pkgdir}"/etc/makepkg.d/backports-patched/patches/${_p3}
}
