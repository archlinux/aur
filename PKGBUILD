# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: sukanka <su975853527[AT]gmail.com>
# Contributor: Batuhan Baserdem <lastname dot firstname at gmail>

# disable package compression (optional but highly recommended)
# PKGEXT='.pkg.tar'
# enable optional products
declare -Ag _products=(
  # [5g_toolbox]="5G Toolbox"
  # [autosar_blockset]="AUTOSAR Blockset"
  # [aerospace_blockset]="Aerospace Blockset"
  # [aerospace_toolbox]="Aerospace Toolbox"
  # [antenna_toolbox]="Antenna Toolbox"
  # [audio_toolbox]="Audio Toolbox"
  # [automated_driving_toolbox]="Automated Driving Toolbox"
  # [bioinformatics_toolbox]="Bioinformatics Toolbox"
  # [bluetooth_toolbox]="Bluetooth Toolbox"
  # [c2000_microcontroller_blockset]="C2000 Microcontroller Blockset"
  # [communications_toolbox]="Communications Toolbox"
  # [computer_vision_toolbox]="Computer Vision Toolbox"
  # [control_system_toolbox]="Control System Toolbox"
  # [curve_fitting_toolbox]="Curve Fitting Toolbox"
  # [dds_blockset]="DDS Blockset"
  # [dsp_hdl_toolbox]="DSP HDL Toolbox"
  # [dsp_system_toolbox]="DSP System Toolbox"
  # [data_acquisition_toolbox]="Data Acquisition Toolbox" # Windows only!
  # [database_toolbox]="Database Toolbox"
  # [datafeed_toolbox]="Datafeed Toolbox"
  # [deep_learning_hdl_toolbox]="Deep Learning HDL Toolbox"
  # [deep_learning_toolbox]="Deep Learning Toolbox"
  # [econometrics_toolbox]="Econometrics Toolbox"
  # [embedded_coder]="Embedded Coder"
  # [financial_instruments_toolbox]="Financial Instruments Toolbox"
  # [financial_toolbox]="Financial Toolbox"
  # [fixed-point_designer]="Fixed-Point Designer"
  # [fuzzy_logic_toolbox]="Fuzzy Logic Toolbox"
  # [gpu_coder]="GPU Coder"
  # [global_optimization_toolbox]="Global Optimization Toolbox"
  # [hdl_coder]="HDL Coder"
  # [hdl_verifier]="HDL Verifier"
  # [image_acquisition_toolbox]="Image Acquisition Toolbox"
  # [image_processing_toolbox]="Image Processing Toolbox"
  # [industrial_communication_toolbox]="Industrial Communication Toolbox"
  # [instrument_control_toolbox]="Instrument Control Toolbox"
  # [lte_toolbox]="LTE Toolbox"
  # [lidar_toolbox]="Lidar Toolbox"
  # [coder]="MATLAB Coder"
  # [compiler]="MATLAB Compiler"
  # [compiler_sdk]="MATLAB Compiler SDK"
  # [parallel_server]="MATLAB Parallel Server"
  # [production_server]="MATLAB Production Server"
  # [report_generator]="MATLAB Report Generator"
  # [test]="MATLAB Test"
  # [web_app_server]="MATLAB Web App Server"
  # [mapping_toolbox]="Mapping Toolbox"
  # [medical_imaging_toolbox]="Medical Imaging Toolbox"
  # [mixed-signal_blockset]="Mixed-Signal Blockset"
  # [model_predictive_control_toolbox]="Model Predictive Control Toolbox"
  # [model-based_calibration_toolbox]="Model-Based Calibration Toolbox"
  # [motor_control_blockset]="Motor Control Blockset"
  # [navigation_toolbox]="Navigation Toolbox"
  # [optimization_toolbox]="Optimization Toolbox"
  # [parallel_computing_toolbox]="Parallel Computing Toolbox"
  # [partial_differential_equation_toolbox]="Partial Differential Equation Toolbox"
  # [phased_array_system_toolbox]="Phased Array System Toolbox"
  # [polyspace_bug_finder]="Polyspace Bug Finder"
  # [polyspace_bug_finder_server]="Polyspace Bug Finder Server"
  # [polyspace_code_prover]="Polyspace Code Prover"
  # [polyspace_code_prover_server]="Polyspace Code Prover Server"
  # [polyspace_test]="Polyspace Test"
  # [powertrain_blockset]="Powertrain Blockset"
  # [predictive_maintenance_toolbox]="Predictive Maintenance Toolbox"
  # [rf_blockset]="RF Blockset"
  # [rf_pcb_toolbox]="RF PCB Toolbox"
  # [rf_toolbox]="RF Toolbox"
  # [ros_toolbox]="ROS Toolbox"
  # [radar_toolbox]="Radar Toolbox"
  # [reinforcement_learning_toolbox]="Reinforcement Learning Toolbox"
  # [requirements_toolbox]="Requirements Toolbox"
  # [risk_management_toolbox]="Risk Management Toolbox"
  # [robotics_system_toolbox]="Robotics System Toolbox"
  # [robust_control_toolbox]="Robust Control Toolbox"
  # [satellite_communications_toolbox]="Satellite Communications Toolbox"
  # [sensor_fusion_and_tracking_toolbox]="Sensor Fusion and Tracking Toolbox"
  # [serdes_toolbox]="SerDes Toolbox"
  # [signal_integrity_toolbox]="Signal Integrity Toolbox"
  # [signal_processing_toolbox]="Signal Processing Toolbox"
  # [simbiology]="SimBiology"
  # [simevents]="SimEvents"
  # [simscape]="Simscape"
  # [simscape_battery]="Simscape Battery"
  # [simscape_driveline]="Simscape Driveline"
  # [simscape_electrical]="Simscape Electrical"
  # [simscape_fluids]="Simscape Fluids"
  # [simscape_multibody]="Simscape Multibody"
  # [simulink]="Simulink"
  # [simulink_3d_animation]="Simulink 3D Animation"
  # [simulink_check]="Simulink Check"
  # [simulink_coder]="Simulink Coder"
  # [simulink_compiler]="Simulink Compiler"
  # [simulink_control_design]="Simulink Control Design"
  # [simulink_coverage]="Simulink Coverage"
  # [simulink_design_optimization]="Simulink Design Optimization"
  # [simulink_design_verifier]="Simulink Design Verifier"
  # [simulink_desktop_real-time]="Simulink Desktop Real-Time"
  # [simulink_fault_analyzer]="Simulink Fault Analyzer"
  # [simulink_plc_coder]="Simulink PLC Coder"
  # [simulink_real-time]="Simulink Real-Time"
  # [simulink_report_generator]="Simulink Report Generator"
  # [simulink_test]="Simulink Test"
  # [soc_blockset]="SoC Blockset"
  # [spreadsheet_link]="Spreadsheet Link" # Windows only!
  # [stateflow]="Stateflow"
  # [statistics_and_machine_learning_toolbox]="Statistics and Machine Learning Toolbox"
  # [symbolic_math_toolbox]="Symbolic Math Toolbox"
  # [system_composer]="System Composer"
  # [system_identification_toolbox]="System Identification Toolbox"
  # [text_analytics_toolbox]="Text Analytics Toolbox"
  # [uav_toolbox]="UAV Toolbox"
  # [vehicle_dynamics_blockset]="Vehicle Dynamics Blockset"
  # [vehicle_network_toolbox]="Vehicle Network Toolbox"
  # [vision_hdl_toolbox]="Vision HDL Toolbox"
  # [wlan_toolbox]="WLAN Toolbox"
  # [wavelet_toolbox]="Wavelet Toolbox"
  # [wireless_hdl_toolbox]="Wireless HDL Toolbox"
  # [wireless_testbench]="Wireless Testbench"
)

pkgbase="matlab"
pkgname=(
  "${pkgbase}"
  "java-${pkgbase}"
  "${pkgbase}-gcc"
  "${pkgbase}-gcc-fortran"
)
pkgver=R2025b+25.2.0.2998904
_release="${pkgver%+*}"
_version="${pkgver##*+}"
pkgrel=3
epoch=1
pkgdesc="A high-level language for numerical computation and visualization"
arch=('x86_64')
url="https://www.mathworks.com/products/matlab.html"
license=('custom:MATLAB EULA')
makedepends=(
  'gendesk'
  'gnutls3.8.9'
  'inotify-tools'
  'matlab-mpm'
  # 'patchelf'
)
source=("matlab_jenv.hook")
sha256sums=('396187ed4f1a516327fbce96140114983a17d6e64988f0c5d95d036353c0fe51')

for _product in "${!_products[@]}"; do
  provides+=(
    "${pkgbase}-${_product}-release=${_release}"
    "${pkgbase}-${_product}-version=${_version}"
    "${pkgbase}-${_release,,}-${_product}=${_version}"
  )
  conflicts+=(
    "${pkgbase}-${_release,,}-${_product}"
  )
done

prepare() {
  cd "${srcdir}"
  echo "  -> Cleaning old directories..."
  rm -rf download install install-java tmp
  mkdir -p download install install-java tmp

  echo "  -> Starting log watcher..."
  : > "tmp/mathworks_${USER}.log"
  tail -n 0 -F "tmp/mathworks_${USER}.log" |
    sed --unbuffered 's/^[^)]*) *//; s/^/    -> /' &
  tail_pid=$!

  echo "  -> Starting download progress watcher..."
  (
    inotifywait -mrq -e create --format '%w%f' download |
      while read -r f; do
        printf "\r\033[K    -> Downloading %s...\r" "${f#download/}"
      done
  ) &
  download_pid=$!

  echo "  -> Starting install progress watcher..."
  (
    inotifywait -mrq -e create --format '%w%f' install |
      while read -r f; do
        printf "\r\033[K    -> Installing %s...\r" "${f#install/}"
      done
  ) &
  install_pid=$!

  _cleanup() {
    echo "  -> Cleaning up background processes..."
    kill "$tail_pid" "$download_pid" "$install_pid" 2>/dev/null
    wait "$tail_pid" "$download_pid" "$install_pid" 2>/dev/null || true
  }
  trap _cleanup EXIT

  local _product_list=""
  for _product in "${_products[@]}"; do
    _product_list+="${_product//-/_} "
  done
  _product_list="${_product_list% }"

  echo "  -> Downloading archives using MPM. This will take a while..."
  TMPDIR="${srcdir}/tmp" matlab-mpm download \
    --release="${_release}" \
    --destination="${srcdir}/download" \
    --products="${_product_list:+${_product_list} }MATLAB" \
    --platforms="glnxa64" \
    --no-deps # provides implicit product selection correctness check during install

  if [[ ! -d download || -z $(ls -A download) ]]; then
    echo "  ==> ERROR: MPM download succeeded but download directory is empty!"
    exit 1
  fi
  echo "  -> Download completed successfully."

  echo "  -> Installing archives using MPM. This will take a while..."
  TMPDIR="${srcdir}/tmp" matlab-mpm install \
    --source="${srcdir}/download" \
    --destination="${srcdir}/install" \
    --products="${_product_list:+${_product_list} }MATLAB" \
    --no-jre \
    --no-gpu # is this needed?

  if [[ ! -d install || -z $(ls -A install) ]]; then
    echo "  ==> ERROR: MPM install succeeded but install directory is empty!"
    exit 1
  fi
  echo "  -> Install completed successfully."

  echo "  -> Ignore the above post-installation instructions (if any). They do not apply to you!"

  _cleanup
  trap - EXIT
}

pkgver() {
  cd "${srcdir}/install"
  local rel ver
  rel="$(sed -n 's:.*<release>\(.*\)</release>.*:\1:p' VersionInfo.xml)"
  ver="$(sed -n 's:.*<version>\(.*\)</version>.*:\1:p' VersionInfo.xml)"
  echo "$rel+$ver"
}

build() {
  cd "${srcdir}"
  echo "  -> Generating desktop file..."
  gendesk -f -n \
    --pkgname "${pkgbase}" \
    --pkgdesc "${pkgdesc}" \
    --name "MATLAB" \
    --comment 'Programming and numeric computing platform' \
    --exec "${pkgbase} -desktop -useStartupFolderPref" \
    --icon "/opt/MATLAB/${_release}/bin/glnxa64/cef_resources/matlab_icon.png" \
    --categories 'Development;Education;Science;Mathematics;IDE' \
    --mimetypes 'application/x-matlab-data;text/x-matlab'

  cd "${srcdir}/install"
  echo "  -> Separating Java components..."
  mv "java" "${srcdir}/install-java/java"

  echo "  -> Modifying GCC version used by MEX..."
  find "bin/glnxa64/mexopts" -type f -name '*.xml' -exec \
    sed -e "s|/usr/local|/usr|g" \
        -e "s|gcc|gcc-${pkgbase}|g" \
        -e "s|g++|g++-${pkgbase}|g" \
        -e "s|gfortran|gfortran-${pkgbase}|g" \
        -i "{}" +

  echo "  -> Downgrading GnuTLS version..."
  find "/usr/lib/gnutls3.8.9" -maxdepth 1 -type f,l -name 'lib*.so*' -exec \
    ln -vsf {} bin/glnxa64/ \;
}

package_matlab() {
  depends=(
    "${pkgname}-meta"
    'sh'
  )
  optdepends=(
    'patchelf: clear the executable stack after the install'
    'matlab-mpm: package manager'
    'matlab-batch: start MATLAB non-interactively using a batch licensing token'
    'python-matlabengine: Python bindings'

    "java-${pkgbase}: required for certain products and features"
    'matlab-gcc: GCC runtime dependency'
    'matlab-gcc-fortran: GFortran runtime dependency'
  )
  provides+=(
    "${pkgname}-release=${_release}"
    "${pkgname}-version=${_version}"
    "${pkgname}-${_release,,}=${_version}"
  )
  conflicts+=(
    "${pkgname}-${_release,,}"
  )
  install="${pkgname}.install"

  cd "${srcdir}"
  echo "  -> Moving files from \$srcdir/ to \$pkgdir/ directly to save space..."
  # install -vdm755 "${pkgdir}/opt/MATLAB/${_release}"
  install -vdm755 "${pkgdir}/opt/MATLAB"
  install -vdm777 "${pkgdir}/opt/MATLAB/${_release}" # :(
  mv install/* "${pkgdir}/opt/MATLAB/${_release}"

  echo "  -> Installing desktop file..."
  install -vDm644 "${pkgbase}.desktop" "${pkgdir}/usr/share/applications/${pkgbase}.desktop"

  echo "  -> Installing license..."
  install -vd "${pkgdir}/usr/share/licenses/${pkgbase}"
  ln -vsf "/opt/MATLAB/${_release}/license_agreement.txt" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.txt"

  echo "  -> Installing symlinks..."
  install -vd "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  for bin in matlab matlab_jenv; do
    ln -vsf "/opt/MATLAB/${_release}/bin/${bin}" "${bin}"
    ln -vsf "/opt/MATLAB/${_release}/bin/${bin}" "${bin}-${_release}"
  done
  # owned by miktex, ...
  for bin in mex mexext; do
    ln -vsf "/opt/MATLAB/${_release}/bin/${bin}" "${pkgbase}-${bin}"
    ln -vsf "/opt/MATLAB/${_release}/bin/${bin}" "${pkgbase}-${bin}-${_release}"
  done
  for bin in MathWorksCrashReporter MathWorksLicenseDeactivation \
             MathWorksProductAuthorizer MathWorksProductUninstaller; do
    ln -vsf "/opt/MATLAB/${_release}/bin/glnxa64/${bin}" "${bin}"
    ln -vsf "/opt/MATLAB/${_release}/bin/glnxa64/${bin}" "${bin}-${_release}"
  done
}

package_java-matlab() {
  pkgdesc+=" (Java components)"
  depends=(
    "${pkgbase}=${epoch}:${pkgver}-${pkgrel}"
    "${pkgname}-meta"
  )
  provides=(
    "${pkgname}-release=${_release}"
    "${pkgname}-version=${_version}"
    "${pkgname}-${_release,,}=${_version}"
  )
  conflicts=(
    "${pkgname}-${_release,,}"
  )
  install="${pkgname}.install"

  cd "${srcdir}"
  echo "  -> Moving files from \$srcdir/ to \$pkgdir/ directly to save space..."
  # install -vdm755 "${pkgdir}/opt/MATLAB/${_release}"
  install -vdm755 "${pkgdir}/opt/MATLAB"
  install -vdm777 "${pkgdir}/opt/MATLAB/${_release}"
  mv install-java/* "${pkgdir}/opt/MATLAB/${_release}"

  echo "  -> Installing Java environment hook..."
  install -vDm644 "matlab_jenv.hook" "${pkgdir}/usr/share/libalpm/hooks/matlab_jenv.hook"
}

# https://www.mathworks.com/support/requirements/supported-compilers-linux.html
_gccs=(8 9 11 12 13)
_gcc="10"
for ver in "${_gccs[@]}"; do
  pkgname+=(
    "${pkgbase}-gcc${ver}"
  )
  
  eval "
package_${pkgbase}-gcc${ver}() {
  pkgdesc+=' (GCC${ver} runtime dependency)'
  arch=('any')
  depends=(
    '${pkgbase}=${epoch}:${pkgver}-${pkgrel}'
    'gcc${ver}'
  )
  provides=(
    'matlab-gcc=${ver}'
    'matlab-gcc-release=${_release}'
    'matlab-gcc-version=${_version}'
    'matlab-${_release,,}-gcc=${_version}'
  )
  conflicts=(
    'matlab-gcc'
    'matlab-${_release,,}-gcc'
  )

  install -vdm755 \"\${pkgdir}/usr/bin\"
  cd \"\${pkgdir}/usr/bin\"
  ln -vsf 'gcc-${ver}' 'gcc-matlab'
  ln -vsf 'gcc-${ver}' 'gcc-matlab-${_release}'
  ln -vsf 'g++-${ver}' 'g++-matlab'
  ln -vsf 'g++-${ver}' 'g++-matlab-${_release}'
}"
done

package_matlab-gcc() {
  pkgdesc+=" (GCC runtime dependency)"
  arch=('any')
  depends=(
    "${pkgbase}=${epoch}:${pkgver}-${pkgrel}"
    "gcc${_gcc}"
  )
  provides=(
    "${pkgname}=${_gcc}"
    "${pkgname}-release=${_release}"
    "${pkgname}-version=${_version}"
    "matlab-${_release,,}-gcc=${_version}"
  )
  conflicts=(
    "matlab-${_release,,}-gcc"
  )

  install -vdm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -vsf "gcc-${_gcc}" "gcc-matlab"
  ln -vsf "gcc-${_gcc}" "gcc-matlab-${_release}"
  ln -vsf "g++-${_gcc}" "g++-matlab"
  ln -vsf "g++-${_gcc}" "g++-matlab-${_release}"
}

package_matlab-gcc-fortran() {
  pkgdesc+=" (GFortran runtime dependency)"
  arch=('any')
  depends=(
    "${pkgbase}=${epoch}:${pkgver}-${pkgrel}"
    "gcc${_gcc}-fortran"
  )
  provides=(
    "${pkgname}=${_gcc}"
    "${pkgname}-release=${_release}"
    "${pkgname}-version=${_version}"
    "matlab-${_release,,}-gcc-fortran=${_version}"
  )
  conflicts=(
    "matlab-${_release,,}-gcc-fortran"
  )

  install -vdm755 "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  ln -vsf "gfortran-${_gcc}" "gfortran-matlab"
  ln -vsf "gfortran-${_gcc}" "gfortran-matlab-${_release}"
}
