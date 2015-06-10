EnsureSConsVersion(0,14);
#EnsurePythonVersion(2,1); this is buggy in scons, so i commented this out

import os;
import string;
import sys

import detect;
import methods;

moc_binary = "moc"

################# QT FILES PARSER ##############

def process_moc_list(moc_list):
	for moc_file in moc_list:
		must_create=0;

		moc_source = moc_file;
		moc_dest = 'moc__' + moc_file[:-2] + '.cpp';
                if (not os.path.exists(moc_dest)):
			must_create=1;
		else:
			date_src = os.path.getmtime(moc_source);
			date_dst = os.path.getmtime(moc_dest);
			if (date_src > date_dst):
				must_create=1;

		if (must_create==0):
			continue;
		moc_command = moc_binary + ' ' + moc_source + ' > ' + moc_dest;

		print("MOC check: " +moc_source);
		print("moc command:" + moc_command);
		os.system(moc_command);

########################

## SCONS is stupid for ignoring the environment.

env = Environment(CPPPATH = ['#/common','#.','#/common/defines'], ENV=os.environ);

opts = Options(['custom.py'])
opts.Add('optimize', 'Optimize.', 0)
opts.Add('debug', 'Add debug symbols.', 0)
opts.Add('prefix', 'The installation prefix', '/usr/local/')

opts.Update(env)

Help(opts.GenerateHelpText(env))

env.__class__.make_targets = methods.make_targets
#env.__class__.Dir = Dir
env.build_dir = None
env.make_so = None
env.detect = detect.Detect()

if os.environ.has_key('DISTCC_HOSTS'):
	env['CXX'] = os.environ['CXX']
	env['ENV']['DISTCC_HOSTS'] = os.environ['DISTCC_HOSTS']
	env['ENV']['HOME'] = os.environ['HOME']

env['CXX'] = os.environ['CXX']

if (detect.check_dependences(env.detect)):
	sys.exit(1);

moc_binary="/usr/bin/moc-qt4"
env.detect.moc_bin=moc_binary
print "detected " + env.detect.moc_bin;

#env.sigc_flags=sigc_flags;
#env.sigc_libs=sigc_libs;
#env.gtkmm_flags=gtkmm_flags;
#env.gtkmm_libs=gtkmm_libs;

env.Append(CXXFLAGS=env.detect.sigc_flags);
env.Append(CXXFLAGS=env.detect.dl_flags);
env.Append(CXXFLAGS="-trigraphs");
env.Append(CXXFLAGS="-Wpointer-arith");

#detect OSS

env.Append(CXXFLAGS=['-fpermissive']);
env.Append(CXXFLAGS=['-Wno-deprecated']);
env.Append(CXXFLAGS=['-D_GLIBCXX_DEBUG']);
env.Append(CXXFLAGS=['-DPOSIX_ENABLED']);
env.Append(CXXFLAGS=['-DBITS_PER_BYTE='+
                     str(env.detect.bits_per_byte)]);

if (env.detect.need_gmp):
	env.Append(CXXFLAGS=['-DNEED_GMP']);
	env.Append(LIBS=['-lgmp']);
if (env.detect.have_libaudiofile):
	env.Append(LIBS=['-laudiofile']);
	env.Append(CXXFLAGS=['-DHAVE_LIBAUDIOFILE']);
if (env.detect.need_limit_macros_define) :
	env.Append(CXXFLAGS=['-D__STDC_LIMIT_MACROS']);
if (env.detect.have_gnu_basename) :
	env.Append(CXXFLAGS=['-DHAVE_GNU_BASENAME']);
if (env.detect.have_xpg_basename) :
	env.Append(CXXFLAGS=['-DHAVE_XPG_BASENAME']);
if (env.detect.have_stdint_h) :
	env.Append(CXXFLAGS=['-DHAVE_STDINT_H']);
if (env.detect.have_msint) :
	env.Append(CXXFLAGS=['-DHAVE_MSINT']);
if (env.detect.have_mmap) :
	env.Append(CXXFLAGS=['-DHAVE_MMAP']);
if (env.detect.have_madvise) :
	env.Append(CXXFLAGS=['-DHAVE_MADVISE']);
env.Append(CXXFLAGS=['-g','-Wall']);

if os.environ.has_key('USE_STACK_CHECK'):
	env.Append(CXXFLAGS=['-fstack-check']);


env.optimize_resampler_hack=0

if (env['optimize']):
	env.Append(CXXFLAGS=['-O3','-ffast-math','-fno-strict-aliasing']);
	env.optimize_resampler_hack=0

profile=0;

if (profile):
	env.Append(CXXFLAGS=['-pg']);
	env.Append(LINKFLAGS=['-pg']);

if (env.detect.os_is_cygwin):
	env.Append(CXXFLAGS=['-DCYGWIN_ENABLED']);
	env.Append(LIBS=['winmm']);
else:
	env.Append(CXXFLAGS=['-DLADSPA_ENABLED']);

if (env.detect.os_is_macosx):
	env.Append(CXXFLAGS=['-DMACOSX_ENABLED']);
	env.Append(LINKFLAGS=['-framework','CoreAudio'])
	env.Append(CPPFLAGS=['-I/sw/include']);

if (env.detect.is_oss_installed):
	env.Append(CXXFLAGS=['-DOSS_ENABLED']);

if (os.environ.has_key('ZYN_DUMMY_DRIVERS')):
	env.Append(CSSFLAGS=['-DDUMMY_ENABLED']);

if (env.detect.has_jack):
	env.Append(CXXFLAGS=['-DJACK_ENABLED']);
	env.Append(CXXFLAGS=env.detect.jack_flags);

if (env.detect.has_alsa):
	env.Append(CXXFLAGS=['-DALSA_ENABLED']);
	env.Append(CXXFLAGS=env.detect.alsa_flags);

env.detect.use_stlport=0
env.detect.use_stlport_debug=1

if (env.detect.use_stlport):
	env.Append(CXXFLAGS=['-I/usr/include/stlport','-DUSING_STLPORT']);
	if (env.detect.use_stlport_debug):
		env.Append(CXXFLAGS=['-D_STLP_DEBUG']);
		env.Append(LIBS=['stlport_debug']);
	else:
		env.Append(LIBS=['stlport']);



env.Append(LIBS=['z','m','pthread']);



env.common_libs=[];
env.process_moc_list=process_moc_list;
env.dl_flags = env.detect.dl_flags
env.dl_libs = env.detect.dl_libs
env.dl_link_flags = env.detect.dl_link_flags

env.detect.qt_flags = os.popen("pkg-config Qt3Support --cflags").read()
env.qt_flags = env.detect.qt_flags
env.detect.qt_libs = os.popen("pkg-config Qt3Support --libs").read()
env.qt_libs = env.detect.qt_libs
env.detect.qt_link_flags = os.popen("pkg-config Qt3Support --libs").read()
env.qt_link_flags = env.detect.qt_libs

env.sigc_flags=env.detect.sigc_flags
env.sigc_libs=env.detect.sigc_libs
env.sigc_link_flags=env.detect.sigc_link_flags


env.bin_targets = [];

Export('env');

SConscript('common/SCsub');
SConscript('cheesetracker/SCsub');

if env['prefix']:
        dst_target = env.Install(env['prefix']+'/bin', env.bin_targets)
        env.Alias('install', dst_target )



