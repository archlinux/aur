# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Helper scripts for tests that use the ROS launch tool."
url='http://www.ros.org/'

pkgname='ros-ardent-launch-testing'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-ardent-ament-index-python
  ros-ardent-launch)
depends=(${ros_depends[@]})

# Git version (e.g. for debugging)
# _tag=release/ardent/launch_testing/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/launch-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="launch-release-release-ardent-launch_testing-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/launch-release/archive/release/ardent/launch_testing/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('396700f72c251aaa4f67627583b69d7097af0044d28f93b85a5ca87c7e6a95d2')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
