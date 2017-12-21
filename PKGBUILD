# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The ability to perform static code analysis on C/C++ code using Cppcheck and generate xUnit test result files."
url='http://www.ros.org/'

pkgname='ros-ardent-ament-cppcheck'
pkgver='0.4.0'
_pkgver_patch=0
arch=('any')
pkgrel=1
license=('Apache License 2.0')

ros_makedepends=()
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=()
depends=(${ros_depends[@]}
  cppcheck)

# Git version (e.g. for debugging)
# _tag=release/ardent/ament_cppcheck/${pkgver}-${_pkgver_patch}
# _dir=${pkgname}
# source=("${_dir}"::"git+https://github.com/ros2-gbp/ament_lint-release.git"#tag=${_tag})
# sha256sums=('SKIP')

# Tarball version (faster download)
_dir="ament_lint-release-release-ardent-ament_cppcheck-${pkgver}-${_pkgver_patch}"
source=("${pkgname}-${pkgver}-${_pkgver_patch}.tar.gz"::"https://github.com/ros2-gbp/ament_lint-release/archive/release/ardent/ament_cppcheck/${pkgver}-${_pkgver_patch}.tar.gz")
sha256sums=('ee38b6c3c90b4359b1b5311dd03abc750274e36dd7baefd30cb381369229907e')

package() {
  cd "${srcdir}/${_dir}"
  python setup.py install --root="$pkgdir" --prefix="/opt/ros/ardent" --optimize=1
}
