# Maintainer: Alexander Daum <alexander.daum at mailbox dot org>

pkgname='tobii_eye_tracker_manager'
pkgver=27.2
pkgrel=1
pkgdesc='Tobii Eye Tracker Manager'
url='https://connect.tobii.com/s/etm-downloads'
license=(
 'custom'
)
source=(
 "https://s3-eu-west-1.amazonaws.com/tobiipro.eyetracker.manager/linux/TobiiProEyeTrackerManager-2.7.2.deb"
)
sha512sums=('54d5a1227006596fee5b60f73659a36c7a5c0db8977c1c25fe15fd9510b37a19a33de71ab6db23ce4b124e1b35df4d26258e405e99d8614e9ae0d50b9031ac25')
arch=(
 'x86_64'
 'i686'
)

package() {
    cd "$srcdir"
    bsdtar -xf "${srcdir}"/data.tar.xz -C "${pkgdir}/"
    chown root:root -R "${pkgdir}"
}
