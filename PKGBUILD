# Maintainer: Nocifer <apmichalopoulos at gmail dot com>

pkgname=zmeventnotification
pkgver=6.1.29.ga306ad2
pkgrel=4
pkgdesc='A machine learning powered, secure websocket & MQTT based event notification server for ZoneMinder'
arch=('any')
url='https://github.com/ZoneMinder/zmeventnotification'
license=('GPL-2.0-only')
depends=('opencv' 'perl-config-inifiles' 'perl-crypt-eksblowfish' 'perl-json' 'perl-lwp-protocol-https' 'perl-net-mqtt-simple'
         'perl-net-websocket-server' 'python-face_recognition' 'python-gifsicle' 'python-imageio' 'python-imageio-ffmpeg'
         'python-imutils' 'python-pyzm' 'python-requests' 'python-scikit-learn' 'python-shapely'
         # ¯\_(ツ)_/¯
         'python-mysql-connector' 'python-psutil' 'python-sqlalchemy' 'qt5-base'
         # Uncomment the next line to enable support for the Google Coral Edge TPU
         #'edgetpu_api'
         )
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
backup=('etc/zoneminder/zmeventnotification.ini'
        'etc/zoneminder/secrets.ini'
        'etc/zoneminder/objectconfig.ini'
        'etc/zoneminder/es_rules.json')
install=${pkgname}.install
source=("https://github.com/ZoneMinder/${pkgname}/archive/a306ad2dbe87c5ace3d0ba89d9d4235fd489424b.zip"
        'https://raw.githubusercontent.com/pjreddie/darknet/master/data/coco.names'
        # YOLOv3
        'https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3.cfg'
        'https://pjreddie.com/media/files/yolov3.weights'
        # YOLOv3 Tiny
        'https://raw.githubusercontent.com/pjreddie/darknet/master/cfg/yolov3-tiny.cfg'
        'https://pjreddie.com/media/files/yolov3-tiny.weights'
        # YOLOv4
        'https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4.cfg'
        'https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights'
        # YOLOv4 Tiny
        'https://raw.githubusercontent.com/AlexeyAB/darknet/master/cfg/yolov4-tiny.cfg'
        'https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v4_pre/yolov4-tiny.weights'
        # Google Coral Edge TPU
        'https://dl.google.com/coral/canned_models/coco_labels.txt'
        'https://github.com/google-coral/edgetpu/raw/master/test_data/ssd_mobilenet_v2_coco_quant_postprocess_edgetpu.tflite'
        'https://github.com/google-coral/edgetpu/raw/master/test_data/ssd_mobilenet_v2_face_quant_postprocess_edgetpu.tflite'
        'https://github.com/google-coral/test_data/raw/master/ssdlite_mobiledet_coco_qat_postprocess_edgetpu.tflite'
        )
b2sums=('90b1a42202bd3d9c7a07e808180a937c4a55e83f2bdf207b2955b01a5cfa0d8fafa1524983dc9a65457bea0b2d7b5219f543b9478c7245c4282051a43a6bee5a'
        '0dedadffac9f2b7d2b0c685caf7a0e4755afa06931b3aa3aa9aeb6fa0ec5db4a9c3111092d1a35fb5f2311493d61ff7fc26de8dba7cee80806538af0a6f03566'
        '6129ec17d519b025f338274eb4d373b0a93e9081ec06ac3fd3953280b6d5bd9a6cfa0ff4d3d1f88f61cfab9682e51a24d33811e9bdbab4f044ddfbb33c418ab5'
        '7678167b299c8f3f458eefe1c5f58667585332d33fd3946993fc38d663dbd848f2a798092337f9d04720c0cbbfc2471571d5b82eb67e2b3440a025f531298011'
        'bcaedf19ad7e55fbcce0382d42fcd4929fe82c05b792914aa3292841008960e2593bd860b9f2865ad4d81395bb6d84c6d8124d0038133b7e974f4b95daa78845'
        'f98b3f35cd573de364094e43a754b407d2785dc3ed1c1760a1a91d8b3407f2fbf4a54123fe1d3f50cd29131a315064073a0b54bf86451e9616a25b0ac3a57575'
        'aa6b8653bca9376e1ae265db35534d6db0a9cf1cb54b2ed061752041316561f114b5a25a1c367980071e4323935641e4e6af086e09ad0fb6276bfcc8894fd37e'
        '235705d527e07d433965930bc9cf5e73cba26e23a1861ed6b3db37d88aa59656884622442987095df2127b03ad1006c84d2c9021e1586fccf3befd3d8f2b618c'
        'f41fff69542a8f38cfbdb0456bb80a7dd6e6c635542c66f697dec1489861e911cc476274e5d0bbd7e00bf8ec20464a803e6e0802ce8a5ae7b71c63d02d230b3a'
        'cfb4215d19cf7e759bb17a4afdba373d6bfec2c44e4c3212967abd697e5fcc6d3124c6fdc2484e38936ac66311378b8331d158284182a53aeed18635291c4ef7'
        '2944afa72472e77d3eccb299d710bc3abfcd7e0cb194dfb279c966cc809b3e15ff36a94ce08828e04ef4bd34780532cffa222a976864110cf9e639cd0733c89a'
        '8bbddb185fbfe8bfa01e4bd282d9f7875929be0d456e84cc3fd5aad51a47f32c54116a55b0c2c7ec1bad84ab11935f0b7f58b4a53295b056e9f25ed7fa6ede44'
        'a18aad7db47aa1a54c37ba0fa2e773e94f4378e5826dd9c466e2082e962768fa7e5e704ca4702168b4271b03b112ad5a939056128ce5340baca1dc82f15b3434'
        'f18412cf71a8383704923248c5034b20bb796360884b011bf8852062a99818cba6ad3c69cf9e7e97aa19f005f11eca6a0382a7a7cdf444c7a56da982f2cd7749')

prepare() {
    cd ${pkgname}-a306ad2dbe87c5ace3d0ba89d9d4235fd489424b

    # Change the default upstream ZM address to match the one used by the ZoneMinder package
    sed -i 's|https://portal/zm|http://localhost:8095|g' secrets.ini
}

build() {
    cd ${pkgname}-a306ad2dbe87c5ace3d0ba89d9d4235fd489424b/hook

    # Build the accompanying Python package zmes_hooks
    python -m build --wheel --no-isolation
}

package() {
    # Create the folder structure
    install -dm755                                                          ${pkgdir}/etc/zoneminder
    install -dm755                                                          ${pkgdir}/usr/bin
    install -dm755                                                          ${pkgdir}/var/lib/${pkgname}
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/bin
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/push
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/contrib
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/images
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/mlapi
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/known_faces
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/unknown_faces
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu
    install -dm755 -o http -g http                                          ${pkgdir}/var/lib/${pkgname}/misc

    # Move the object recognition model files into place
    install -m644 yolov3.cfg                                                ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/yolov3
    install -m644 yolov3.weights                                            ${pkgdir}/var/lib/${pkgname}/models/yolov3

    install -m644 yolov3-tiny.cfg                                           ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3
    install -m644 yolov3-tiny.weights                                       ${pkgdir}/var/lib/${pkgname}/models/tinyyolov3

    install -m644 yolov4.cfg                                                ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/yolov4
    install -m644 yolov4.weights                                            ${pkgdir}/var/lib/${pkgname}/models/yolov4

    install -m644 yolov4-tiny.cfg                                           ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -m644 coco.names                                                ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4
    install -m644 yolov4-tiny.weights                                       ${pkgdir}/var/lib/${pkgname}/models/tinyyolov4

    install -m644 coco_labels.txt                                           ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu/coco_indexed.names
    install -m644 ssd_mobilenet_v2_coco_quant_postprocess_edgetpu.tflite    ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu
    install -m644 ssd_mobilenet_v2_face_quant_postprocess_edgetpu.tflite    ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu
    install -m644 ssdlite_mobiledet_coco_qat_postprocess_edgetpu.tflite     ${pkgdir}/var/lib/${pkgname}/models/coral_edgetpu

    # Move the rest of the files into place
    cd ${pkgname}-a306ad2dbe87c5ace3d0ba89d9d4235fd489424b

    install -m755 -o http -g http zmeventnotification.pl                    ${pkgdir}/usr/bin

    install -m755 -o http -g http pushapi_plugins/pushapi_pushover.py       ${pkgdir}/var/lib/${pkgname}/bin

    install -m755 -o http -g http hook/zm_event_start.sh                    ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_event_end.sh                      ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_detect.py                         ${pkgdir}/var/lib/${pkgname}/bin
    install -m755 -o http -g http hook/zm_train_faces.py                    ${pkgdir}/var/lib/${pkgname}/bin

    install -m644 -o http -g http docs/guides/contrib_guidelines.rst        ${pkgdir}/var/lib/${pkgname}/contrib
    install -m755 -o http -g http contrib/*                                 ${pkgdir}/var/lib/${pkgname}/contrib

    install -m644 zmeventnotification.ini                                   ${pkgdir}/etc/zoneminder/
    install -m644 secrets.ini                                               ${pkgdir}/etc/zoneminder/
    install -m644 hook/objectconfig.ini                                     ${pkgdir}/etc/zoneminder/
    install -m644 es_rules.json                                             ${pkgdir}/etc/zoneminder/

    # Temp fix for hardcoded /zm/ links in the configuration files
    ln -sf /etc/zoneminder                                                  ${pkgdir}/etc/zm

    # Install the accompanying Python package zmes_hooks
    cd hook
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
