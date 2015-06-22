################ needed imports
import os
import sys
import subprocess
import platform

################ base paths (needed for Win32 OS)
sdlbase = 'Z:\\win32\\SDL-1.2.13'
sdlimagebase = 'Z:\\win32\\SDL_image-1.2.7'
sdlmixerbase = 'Z:\\win32\\SDL_mixer-1.2.11'
fftw3base = 'Z:\\win32\\fftw-3.2.2.pl1-dll32'
bzip2base = 'Z:\\win32\\bzip2-1.0.5-lib'

glheader  = 'C:\\Program Files\\Microsoft SDKs\\Windows\\v6.0A\\Include\\gl'
gllibrary = 'C:\\Program Files\\Microsoft SDKs\\Windows\\v6.0A\Lib'
cheader   = 'C:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\include'
clibrary  = 'C:\\Program Files\\Microsoft Visual Studio 9.0\\VC\\lib'
wheader   = 'C:\\Program Files\\Microsoft SDKs\\Windows\\v6.0A\\Include'

mingw32root = '/usr/mingw32'
#sdlbase = os.environ['SDL']
#sdlimagebase = os.environ['SDLIMAGE']
#sdlmixerbase = os.environ['SDLMIXER']
#fftw3base = os.environ['FFTW']
#glbase = os.environ['GLBASE']

################ command line config
debug = int(ARGUMENTS.get('debug', 0))
devel = int(ARGUMENTS.get('devel', 0))
cvedit = int(ARGUMENTS.get('cvedit', 0))
useicc = int(ARGUMENTS.get('useicc', 0))
usex86sse = int(ARGUMENTS.get('usex86sse', 0))
useefence = int(ARGUMENTS.get('useefence', 0))
useduma = int(ARGUMENTS.get('useduma', 0))
archflag = ARGUMENTS.get('arch', '')
mingw32 = ARGUMENTS.get('mingw32', 0)
conf = ARGUMENTS.get('conf', 1)
tests = ARGUMENTS.get('tests', 1)

################ set environment
osspecificsrc = []
extralibs = ['bz2']
fftwlib = 'fftw3'

env = Environment()
checkconf = True
if (env.GetOption('clean') or conf == '0'):
	checkconf = False

if sys.platform == 'win32':
	checkconf = False
	print "Compiling for Win32 Environment"
	env = Environment(ENV = os.environ)

	env.Append(CPPDEFINES = ['WIN32','NOMINMAX','DEBUG']) 
	env.Append(CCFLAGS = '/EHsc' )

	## /EHsc

	fftwlib = 'libfftw3-3'
	extralibs = ['bzip2']

	env.Append(CPPPATH = [sdlbase + '\\include', sdlimagebase + '\\include', sdlmixerbase + '\\include', bzip2base + '\\include', fftw3base, glheader,cheader,wheader])
	libpath = [sdlbase + '\\lib', sdlimagebase + '\\lib', sdlmixerbase + '\\lib', bzip2base + '\\lib', fftw3base, gllibrary, clibrary]
	gllibs = ['opengl32', 'glu32']
	sdllibs = ['SDL', 'SDL_image']
	datadir = './data'	# use slashes as separator always. C/C++ want it so.
	build_dir = 'win32'

elif sys.platform == 'darwin':
	print "Compiling for MacOSX"
	env = Environment(ENV = os.environ)
	env.Append(CPPPATH = ['/System/Library/Frameworks/AGL.framework/Headers', '/System/Library/Frameworks/OpenGL.framework/Headers','/Developer/SDKs/MacOSX10.4u.sdk/usr/X11R6/include' , './Mac'])
	libpath = ['/System/Library/Frameworks/OpenGL.framework/Libraries', '/usr/local/lib', '/usr/lib']
	gllibs = []
	sdllibs = ['SDL', 'SDL_image']
	env.Append(CCFLAGS = '-Wall -g -O2 `sdl-config --cflags`')
	env.Append(LINKFLAGS = '-F/System/Library/Frameworks -framework AGL -framework OpenGL -framework GLUT -framework Cocoa -framework SDL -framework SDL_image -framework SDL_mixer')
	datadir = './data'	# use slashes as separator always. C/C++ want it so.
	build_dir = 'macosx'
	osspecificsrc = Split("""Mac/SDLMain.m""")
        if (debug == 1):
                env.Append(CCFLAGS = '-g')
                env.Append(CPPDEFINES = ['DEBUG'])
elif (sys.platform == 'freebsd5') or (sys.platform == 'freebsd6') or (sys.platform == 'freebsd7'):
	print "Compiling for FreeBSD Environment"
	env = Environment(ENV = os.environ)
	LOCALBASE = os.environ['LOCALBASE']
	X11BASE = os.environ['X11BASE']
	SDL_CONFIG = os.environ['SDL_CONFIG']
	env.Replace(CC = os.environ['CC'])
	env.Replace(CXX = os.environ['CXX'])
	env.Append(CPPPATH = [LOCALBASE + '/include', LOCALBASE + '/include/SDL11', X11BASE + '/include', X11BASE + '/include/GL'])
	libpath = [LOCALBASE + '/lib', X11BASE + '/lib'] 
	gllibs = ['GL', 'GLU']
	sdllibs = ['SDL_image']
	extralibs = ['execinfo']
	cpuinfof = subprocess.Popen( 'sysctl -n hw.instruction_sse', 1024, None, None, subprocess.PIPE, None, None, False, True ).communicate( None )[0].strip();
	cpuinfol = cpuinfof.readlines()
	mmxsupported = False
	ssesupported = False
        for i in cpuinfol:
		if i == '1\n':
			mmxsupported = True
			ssesupported = True
		if (usex86sse == 0) and (mmxsupported and ssesupported):
                	usex86sse = 1
	        if usex86sse >= 1:
			env.Append(CCFLAGS = '-msse')
        	        env.Append(CPPDEFINES = ['USE_SSE'])
	                osspecificsrc += []
	                print 'Using x86 SSE/MMX optimizations.'

        env.Replace(CCFLAGS = os.environ['CFLAGS'])
	if (debug == 1):
		env.Append(CCFLAGS = '-g')
		env.Append(CPPDEFINES = ['DEBUG'])
        env.Replace(CXXFLAGS = os.environ['CXXFLAGS'] + ' `' + SDL_CONFIG + ' --cflags`')
        env.Append(LINKFLAGS = '`' + SDL_CONFIG + ' --libs`')
        datadir = '/usr/local/share/dangerdeep'
        build_dir = 'freebsd'
	
        if (checkconf == True and os.system('grep glBindProgram ' + X11BASE + '/include/GL/gl*.h > /dev/null') == 0):
                gllibdirs = [X11BASE + '/lib/', '/usr/lib/', LOCALBASE + '/lib/']
                gllibdir = ''
                for i in gllibdirs:
                        if (os.system('test -f '+i+'libGL.so') == 0):
                                gllibdir = i
                                break
                if (gllibdir == ''):
                        print 'ERROR: no libGL.so detected!'
                else:
			print 'Found GL library "'+gllibdir+'libGL.so"'
                if (os.system('grep glBindProgram '+gllibdir+'libGL.so > /dev/null') != 0):
                        print 'GL headers declare glBindProgram, but libGL.so has no such symbol! Ignoring all undefined symbols...'
                        # I'm not sure which option will hopefully fix the problem... so i use both...
                        env.Append(LINKFLAGS = '--unresolved-symbols=ignore-all')
                        env.Append(LINKFLAGS = '-Xlinker --unresolved-symbols -Xlinker ignore-all')
elif 0 != mingw32:
	print "Compiling for mingw32 Environment"
	env = Environment(ENV = os.environ, tools = ['mingw'])

	env.Append(CPPPATH = [ mingw32root + '/usr/include/', mingw32root + '/usr/include/GL/', mingw32root + '/usr/include/SDL/' ] )

	# allow env to override defaults
	try:
		env.Replace(CXX = os.environ['CXX'])
	except:
		pass

	try:
		env.Replace(CC = os.environ['CC'])
	except:
		pass

	try:
		env.Replace(AR = os.environ['AR'])
	except:
		pass
	try:
		env.Replace(RANLIB = os.environ['RANLIB'])
	except:
		pass

	libpath = [ mingw32root + '/lib' ]
	gllibs = ['opengl32', 'glu32']
	sdllibs = ['SDL', 'SDL_image']
	env.Append(CPPDEFINES = ['MINGW32'])
	env.Append(CCFLAGS = '-Wall -O2') # for mingw!
	if (usex86sse >= 1):
		osspecificsrc += []
		env.Append(CCFLAGS = '-msse')
		env.Append(CPPDEFINES = ['USE_SSE'])
		print 'Using x86 SSE/MMX optimizations with GCC intrinsics.'
	datadir = './data'	# use slashes as separator always. C/C++ want it so.
	build_dir = 'mingw32'
else:
	SConsignFile()
	print "Compiling for GNU/Linux Environment (" + sys.platform + ")"
	env = Environment(ENV = os.environ)

	env.Append(CPPPATH = ['/usr/include/SDL', '/usr/include/GL'])
	gllibs = ['GL', 'GLU']
	sdllibs = ['SDL', 'SDL_image']

	datadir = '/usr/local/share/dangerdeep'
	build_dir = 'linux'

	ccflags = '-Wall `sdl-config --cflags` `pkg-config --cflags x11`'

	arch = platform.machine()

	# allow arch to be over-ridden if need be.
	if archflag != '':
		print 'Using architecture: ' + archflag + ' (Changed from ' + arch + ')'
		arch = archflag
	else:
		print 'Using architecture: ' + arch

	# Set libpath accordingly
	if arch == 'x86_64':
		archlib = '/usr/lib64'
		arch = 'x86-64'
	else:
		archlib = '/usr/lib'

	# Set libpath for real
	libpath = [archlib, archlib + '/X11', '/usr/X11R6/lib']

	ccflags += ' -march=' + arch

	env.Append(LINKFLAGS = '`pkg-config --libs-only-L x11`')
	if (debug >= 4):
		ccflags += ' -g -pg -O3' # profiling
	elif (debug == 3):
		ccflags += ' -g -O0'
		env.Append(CPPDEFINES = ['DEBUG'])
	elif (debug == 2):
		ccflags += ' -g -O1'
		env.Append(CPPDEFINES = ['DEBUG'])
	elif (debug == 1):
		# same as debug==0 but with DEBUG defined to make logging work (and probably other stuff)
		ccflags += ' -g -O2'
		env.Append(CPPDEFINES = ['DEBUG'])
	elif (debug == -1):
		ccflags += ' -g -O3 -mfpmath=sse -mmmx -msse -m3dnow'
	elif (debug == -2):	# special g++4.0+ auto vectorization
		ccflags += ' -g -O3 -mfpmath=sse -mmmx -msse -m3dnow -ftree-vectorize'
	elif (debug == -3):	# special g++4.0+ auto vectorization
		ccflags += ' -g -O3 -mfpmath=sse -mmmx -msse -msse2 -m3dnow -ftree-vectorize'
	else:
		if (useicc >= 1):
			env.Replace(CC = "icc")
			env.Replace(CXX = "icpc")
			ccflags += ' -ip -w '
			build_dir = 'linux-icc'
		else:
			ccflags += ' -g -O2' # debug symbols will be stripped by the linker for a debian package

	if (useefence >= 1):
		extralibs += ['efence']
		print 'Linking to ElectricFence library!'
	elif (useduma >= 1):
		extralibs += ['duma']
		print 'Linking to DUMA (EletricFence successor) library!'
	if (cvedit == 1):
		env.Append(CPPDEFINES = ['CVEDIT'])

	if usex86sse >= 1:
		env.Append(CPPDEFINES = ['USE_SSE'])
		env.Append(CCFLAGS = '-msse')
		osspecificsrc += []
		if (usex86sse >= 2):
			env.Append(CPPDEFINES = ['USE_SSE_ALWAYS'])
			print 'Using x86 SSE/MMX optimizations with GCC intrinsics ALWAYS WITHOUT DETECTION!'
		else:
			print 'Using x86 SSE/MMX optimizations with GCC intrinsics.'
	env.Append(CCFLAGS = ccflags)

	# check for broken libGL, ignore undefined symbols then
	if (checkconf == True and os.system('grep glBindProgram /usr/include/GL/gl*.h > /dev/null') == 0):
		gllibdirs = ['/usr/X11R6/lib/', '/usr/lib/', '/usr/local/lib/']
		gllibdir = ''
		for i in gllibdirs:
			if (os.system('test -f '+i+'libGL.so') == 0):
				gllibdir = i
				break
		if (gllibdir == ''):
			print 'ERROR: no libGL.so detected!'
		else:
			print 'Found GL library "'+gllibdir+'libGL.so"'
		if (os.system('grep glBindProgram '+gllibdir+'libGL.so > /dev/null') != 0):
			print 'GL headers declare glBindProgram, but libGL.so has no such symbol! Ignoring all undefined symbols...'
			# I'm not sure which option will hopefully fix the problem... so i use both...
			env.Append(LINKFLAGS = '--unresolved-symbols=ignore-all')
			env.Append(LINKFLAGS = '-Xlinker --unresolved-symbols -Xlinker ignore-all')

###### optionally change install and data dirs
if ARGUMENTS.get('datadir', 0):
	datadir = ARGUMENTS.get('datadir', 0)
installbindir = '/usr/local/bin'
if ARGUMENTS.get('installbindir', 0):
	installbindir = ARGUMENTS.get('installbindir', 0)

print 'Install binary path: ' + installbindir
print 'Using data dir: ' + datadir

target_dir = '#build' + os.sep + build_dir
source_base_dir = 'src'
libpath = libpath + [target_dir]
env.Append(LIBPATH = libpath)

################ configure
if(checkconf == True):
	conf = Configure(env)
	ffmpeg_available = False
	if (devel == 0):
		for i in ['GL', 'GLU', 'SDL', 'SDL_image', 'SDL_mixer', 'fftw3', 'bz2']:
			if not conf.CheckLib(i):
				print 'Library ' + i + ' is missing, it must be installed!'
				Exit(1)
		for i in ['gl.h', 'glu.h', 'SDL.h', 'SDL_image.h', 'SDL_mixer.h', 'fftw3.h', 'bzlib.h']:
			if not conf.CheckHeader(i):
				print 'Include file ' + i + ' is missing, install matching development library!'
				Exit(1)
		if conf.CheckLibWithHeader('fftw3f', 'fftw3.h', 'C'):
			print 'fftw3 library supports float type. Using it...'
			fftwlib = 'fftw3f'
			conf.env.Append(CPPDEFINES = ['WITH_FLOAT_FFTW'])
		else:
			print 'fftw3 library does not support float type.'
		if conf.CheckLibWithHeader('avutil', 'ffmpeg/libavutil/avutil.h', 'C'):
			print 'libavutil found...'
			ffmpeg_available = True
	else:
		fftwlib = 'fftw3f'
		conf.env.Append(CPPDEFINES = ['WITH_FLOAT_FFTW'])	# developers always use float...
	env = conf.Finish()
else:
	ffmpeg_available = True

######################### source file lists
gfxlibs = ['oglext'] + gllibs + sdllibs
alllibs = ['dftdmedia', 'tinyxml'] + gfxlibs + ['SDL_mixer', fftwlib] + extralibs

################ show some help when running scons -h
Help("""
	Danger from the Deep, SConstruct file help:
	Type 'scons' to build the binary.
	Type 'scons -c' to clean up.
	Type 'scons install' to install the game (as root).
	Type 'scons tarball' to build a tarball of the source (works only with Linux).
	Extra options (add them to command line, like 'scons extraoption=value'):
	'debug=x' to build debug level x, levels: 0: normal, 1: debug, 2: more debug,
		3: profiling, -1: extreme optimizations, -2: even more extreme optim.
	'usex86sse=x' where x < 0: disable them, 0: autodetect, 1: enable them, 2: force usage (no runtime detection).
	'useefence=x' when x > 0 use the Electric Fence library (for debugging)
	'useduma=x' when x > 0 use the Electric Fence successor DUMA (for debugging)
	""")

################ build
f = open('version.txt', 'r')
version = f.readlines()[0][:-1]
f.close()

Export('env', 'gfxlibs', 'alllibs', 'installbindir', 'datadir', 'version', 'osspecificsrc', 'ffmpeg_available', 'tests')

SConscript(source_base_dir + os.sep + 'SConscript', variant_dir = target_dir, duplicate = 0)

VariantDir(target_dir, source_base_dir, duplicate=0)

############### Helper functions
def findSVN(basedir):
	f = open(basedir + os.sep + '.svn' + os.sep + 'entries')
	lines = f.readlines()
	mydirs = []
	myfiles = []
	for i in range(0, len(lines)):
		if lines[i] == '\x0c\n' and i+2 < len(lines):
			fname = lines[i+1][:-1]
			ftype = lines[i+2][:-1]
			if ftype == 'dir':
				mydirs.append(fname)
			elif ftype == 'file':
				myfiles.append(basedir + os.sep + fname)
	for d in mydirs:
		nextdir = basedir + os.sep + d
		if os.path.isdir(nextdir):
			myfiles += findSVN(nextdir)
	return myfiles

############### option so that "scons tarball" builds a tarball of source
# tar building works only on linux
if (( build_dir == 'linux' ) or ( build_dir == 'freebsd' )) and (os.path.isdir('./.svn')):
	basetarfilename = 'dangerdeep-' + version
	os.system('rm -rf ' + basetarfilename)
	os.system('ln -s . ' + basetarfilename)
	allsvnfiles = findSVN('.')
	filestopack = []
	for i in allsvnfiles:
		if not(i.endswith('.xcf')) and not(i.startswith('./data/')):
			if not(i.startswith('.' + os.sep + 'build')):
				filestopack += [basetarfilename + os.sep + i]
	env.Append(TARFLAGS = '-zh')
	env.Append(TARSUFFIX = '.gz')
	tgz = env.Tar(basetarfilename + '.tar.gz', filestopack)
	env.Alias('tarball', tgz)

############# eof
