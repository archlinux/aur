# general configuration
#########################
with_tests = 'no'
with_warnerrors = 'no'
with_debug = 'no'
with_debug_symbols = 'yes'
with_verbose = 'no'
with_engine_module_checks = 'no'
distro_maintained_info_url = 'https://dragondreams.ch/index.php/dragengine-distro-maintained-update-info#archlinux'

# external library configuration
##################################
with_system_zlib = 'yes'
with_system_libpng = 'yes'
with_system_libapng ='no'
with_system_libjpeg ='yes'
with_system_libwebp = 'yes'
with_system_openal = 'yes'
with_openal_backends = ','.join(['alsa', 'pulseaudio', 'portaudio', 'oss'])
with_system_libogg ='yes'
with_system_libvorbis ='yes'
with_system_libtheora ='yes'
with_system_libopus ='yes'
with_system_fox ='no'
with_system_dragonscript = 'no'
with_system_libffi = 'no'           # smalltalk only
with_system_libltdl = 'no'          # smalltalk only
with_system_libsigsegv = 'no'       # smalltalk only
with_system_smalltalk = 'no'        # smalltalk only
with_system_libevdev = 'yes'
with_system_libusb = 'auto'         # not used
with_system_libhidapi = 'yes'
with_system_libopenhmd = 'no'       # not used
with_system_fftw = 'no'             # not used right now
with_system_soundtouch = 'yes'
with_system_libwebm = 'no'          # not in official repository
with_system_libvpx = 'yes'
with_system_openvr = 'no'           # not build
with_system_openxr = 'yes'
with_opengl = 'yes'
with_python = 'no'
with_npapisdk = 'no'
with_dl = 'yes'
with_pthread = 'yes'
with_x = 'yes'

# modules configuration
#########################
build_audio_openal = 'yes'
build_cr_basic = 'yes'
build_graphics_opengl = 'yes'
build_image_png = 'yes'
build_image_png3d = 'yes'
build_image_jpeg = 'yes'
build_image_webp = 'yes'
build_input_x = 'yes'
build_input_w32 = 'no'
build_input_beos = 'no'
build_input_macos = 'no'
build_input_android = 'no'
build_physics_bullet = 'yes'
build_script_ds = 'yes'
build_script_python = 'no'
build_script_smalltalk = 'no'
build_sound_ogg = 'yes'
build_video_theora = 'yes'
build_video_apng = 'yes'
build_igde = 'yes'
build_guilauncher = 'yes'
build_plugin_npapi = 'no'
build_launcher_android = 'no'
build_archive_delga = 'yes'
build_vr_openvr = 'no'
build_vr_openxr = 'yes'

build_igde = 'yes'
igde_program_name = 'deigde'
igde_toolkit = 'fox'
build_editor_animator = 'yes'
build_editor_conversation = 'yes'
build_editor_font = 'yes'
build_editor_gamedefinition = 'yes'
build_editor_langpack = 'yes'
build_editor_particleemitter = 'yes'
build_editor_rig = 'yes'
build_editor_skin = 'yes'
build_editor_sky = 'yes'
build_editor_speechanimation = 'yes'
build_editor_synthesizer = 'yes'
build_editor_world = 'yes'

# archiving
#############
archive_format = 'tarbz2'
archive_name_engine = 'dragengine-linux'
archive_name_engine_dev = 'dragengine-dev-linux'
archive_name_igde = 'deigde-linux'
archive_name_igde_dev = 'deigde-dev-linux'
archive_name_special = 'despecial-linux'
installer_name_engine = 'install-dragengine-linux'
installer_name_engine_dev = 'install-dragengine-dev-linux'
installer_name_igde = 'install-deigde-linux'
installer_name_igde_dev = 'install-deigde-dev-linux'
