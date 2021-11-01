# Maintainer: Arglebargle < arglebargle DASH aur AT arglebargle DOT dev >

# README: This package is a stub that allows you to replace ttf-liberation with ttf-ms-win10/11
#         Before you install this package make sure you install ttf-ms-win10/-win11 first

pkgname=ttf-defenestration
pkgver=2
pkgrel=1
pkgdesc="Shim package to satisfy 'ttf-liberation' dependencies via 'ttf-ms-win1*'; see README.md for details"
arch=(any)
url="https://gitlab.com/arglebargle-arch/ttf-defenestration-PKGBUILD"
license=('BSD')
provides=('ttf-liberation')
conflicts=(
  'ttf-liberation'
  'ttf-ms-fonts<=0'   # this should prevent the actual 'ttf-ms-fonts' package from being accepted
  'ttf-vista-fonts'
  'ttf-win7-fonts'
  'ttf-ms-win8'
)

package() {
  depends=('ttf-ms-fonts')
  optdepends=(
    'ttf-ms-win10: Windows 10 fonts'
    'ttf-ms-win11: Windows 11 fonts'
  )
}

# Author's note: I've used this package with chrome/chromium/firefox and steam for many
# months without any problems
#
# Tested versions:
#
# [arglebargle@arch-g14 ~]$ date
# Thu Oct 29 01:28:40 AM PDT 2020
#
# [arglebargle@arch-g14 ~]$ yay -Qi ttf-ms-win10
# Name            : ttf-ms-win10
# Version         : 10.0.18362.116-2
# ...
#
# [arglebargle@arch-g14 ~]$ yay -Si ttf-liberation
# Repository      : community
# Name            : ttf-liberation
# Version         : 2.1.1-1
# ...
#
# Note: still working fine as of June '21; seems stable enough to publish
#
# arglebargle@arch-zephyrus]$ date
# Sun Jun  6 07:21:32 AM PDT 2021
#
# [arglebargle@arch-zephyrus]$ yay -Qi ttf-ms-win10
# Name            : ttf-ms-win10
# Version         : 10.0.19042.789-1
# ...
