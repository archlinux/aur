/*
 * File: fbdaemon.c
 * Tone generator for alsa audio api
 * based on alsatonic by Coolbrother
 * */

#ifdef DEBUG
#	define DPRINTF(...) do{printf("%s:%4d:",__FILE__,__LINE__);printf(__VA_ARGS__);}while(0)
#else
#	define DPRINTF(...)
#endif
#define LPRINTF(...) if(keepopen){printf("%s:%4d:",prog,__LINE__);printf(__VA_ARGS__);fflush(stdout);}

#include <alsa/asoundlib.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>
#include <unistd.h>
#include <signal.h>

#define BUF_LEN 48000
#define DEF_FREQ 400
#define DEF_DUR  0.1F
#define DEF_NOTE 48
#define MAX_NOTE 87
#define MODNAME "@_PKGBASE@"
#define HELPER_PID "/sys/module/"MODNAME"/parameters/helper_pid"

static unsigned char buffer[BUF_LEN];
static snd_pcm_t *g_handle;
static snd_pcm_sframes_t g_frames;
static int channels =1;
static snd_pcm_format_t format = SND_PCM_FORMAT_U8;
static int rate = 48000;
static float freq = DEF_FREQ; // in hertz
static float dur = DEF_DUR; // in seconds
static int kind = 1; //0 for sine 1 for square wave
static float vol = 0.025F;
static const char *prog = MODNAME"-daemon";
static const char *alsaname = "default";
static const char *evdev = NULL;
static const char *evlink = "/dev/input/by-path/platform-pcspkr-event-spkr";
static int revlink = 0;	//if 1 remove evlink
static const char *modname=MODNAME;
static int	helper_written = 0;	//if 1 try to set helper_pid to 0
static int	keepopen = 0;	//if 1 do not close STDOUT/ERR

#define HELP_TEXT "%s Usage:\n\
  -a name  : use alsa device name ('%s')\n\
  -d dur   : set duration in seconds (%.2f)\n\
  -f freq  : set frequency in HZ, and play it. (%.0fHZ)\n\
  -h       : print this Help\n\
  -r evdev : daemonize if given; optional target for symlink\n\
               %s\n\
  -l       : if given keep stdout & stderr open for log\n\
  -t kind  : sine or square wave (%s)\n\
  -v vol   : volume (%.3f)\n\
\n\
"MODNAME"-daemon is a simple alsa beep daemon designed to work with the\n\
"MODNAME" kernel module. It is normally started via /etc/udev/rules.d/90-"MODNAME".rules\n\
and /usr/bin/"MODNAME"-helper and configured by /etc/"MODNAME"-helper.conf\n\
other daemons can be used with "MODNAME" see eg\n\
https://github.com/mozzwald/Fancy-Beeper-Daemon/tree/master/daemons\n\n"

static unsigned char clamp(float val){
	val = 127.5+(val*127.5);
	return val<=0.0? 0: val>=254.5? 255: (unsigned char)(val+0.5);
}

static void genSine() {
	float t = 2*M_PI*freq/(rate*channels);
	for (int i=0; i< BUF_LEN; i++) {
		buffer[i] = clamp(vol*sin(t*i));
	}
}

static void genSquare(){
	int full_cycle = floorf((float)(rate*channels)/freq),
		half_cycle = floorf((float)full_cycle / 2.0f),
		cycle_index = 0;
	for (int i = 0; i < BUF_LEN; i++) {
		buffer[i] = clamp((cycle_index < half_cycle) ? vol: -vol);
		cycle_index = (cycle_index + 1) % full_cycle;
		}
}

static void openDevice(){
	// open sound device and set params
	snd_output_t *output = NULL;
	int err;

	if ((err = snd_pcm_open(&g_handle, alsaname, SND_PCM_STREAM_PLAYBACK, 0)) < 0) {
		DPRINTF("Playback open error: %s\n", snd_strerror(err));
		exit(EXIT_FAILURE);
	}

	if ((err = snd_pcm_set_params(g_handle,
		format,
		// SND_PCM_FORMAT_S16_LE,
		SND_PCM_ACCESS_RW_INTERLEAVED,
		channels,
		// BUF_LEN,
		rate,
		1, /* period */
		500000)) < 0) { /* latency: 0.5sec */ 
		DPRINTF("Playback open error: %s\n", snd_strerror(err));
		exit(EXIT_FAILURE);
	}
}

static void closeDevice() {
	// closing sound device
	// necessary to flush and send short sample
	snd_pcm_drain(g_handle);
	snd_pcm_close(g_handle);
}

static void writeBuf(unsigned char *buf, int nbFrames, int nbTimes) {
	for (int i=0; i < nbTimes; i++) {
		// Sending the sound
		g_frames += snd_pcm_writei(g_handle, buf, nbFrames);
	}
	DPRINTF("WriteBuf nbFrames: %d\n", g_frames);
}

static void playFreq() {
	// playing one freq
	int nbSamples = rate * channels * dur;
	int nbTimes = nbSamples / BUF_LEN;
	int restFrames = nbSamples % BUF_LEN;
	DPRINTF("restFrames: %d\n", restFrames);
	if (nbSamples >0) {
		(kind==0?genSine:genSquare)();
		if (nbTimes >0) {
			writeBuf(buffer, BUF_LEN, nbTimes);	
		}
		if (restFrames > 0) {
			writeBuf(buffer, restFrames, 1);
		}
	
	}
	DPRINTF("nbFrames: %d\n", g_frames);
}

static void beep(){
	openDevice();
 
	DPRINTF("Playing %s %.3fHz during %.3f secs with vol=%.3f\n", (kind?"square":"sine"), freq, dur, vol);
	playFreq();
	DPRINTF("nbFrames played: %d\n", g_frames);

	closeDevice();
}

static void write_helper(pid_t pid){
	FILE *f = fopen(HELPER_PID,"w");
	if (f) {
		if(fprintf(f,"%ld\n",pid)>=0){
			fflush(f);
			helper_written=1;
		}
		fclose(f);
	}
	LPRINTF("%d write to %s %s\n", pid,HELPER_PID,helper_written?"ok":"failed");
}

// Function to handle termination signals
void sigterm_handler(int sig) {
	if (helper_written){
		if(revlink){
			errno = 0;
			int r = remove(evlink);
			LPRINTF("remove(%s) %s[%d]\n", evlink, (r?"ok":"failed"), errno);
		}
		write_helper(0);
	}
    exit(0);
}

void sigusr1_handler(int sig) {
	beep();
}

pid_t detach(void) {

    // Create a child process to become the daemon
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork");
        exit(1);
    }

    if (pid > 0) return pid;

    // Child process continues as the daemon
    // Set up signal handler
    signal(SIGTERM, sigterm_handler);
    signal(SIGUSR1, sigusr1_handler);

	uid_t uid = getuid();
	LPRINTF("detached uid=%d evdev=%s alsaname=%s\n", uid, evdev, alsaname);
	if (!uid) { //we are root
		pid = getpid();
		LPRINTF("detached pid=%d\n", pid);
		write_helper(pid);
		if(evdev && helper_written) {
			errno = 0;
			revlink = symlink(evdev, evlink);
			LPRINTF("symlink(%s,%s) %s[%d]\n", evlink, evdev, (revlink?"failed":"ok"),errno)
		} else {
			evdev = NULL;
		}
	}


    // Change working directory to avoid file system clutter
    if (chdir("/") != 0) {
        perror("chdir");
        exit(1);
    }


    // Close standard input, output, and error
    close(STDIN_FILENO);
	if (!keepopen) {
    	close(STDOUT_FILENO);
    	close(STDERR_FILENO);
	}

    // Main loop for handling server logic
    while (1) {
		pause();
    }
	return 0;
}

int main(int argc, char *argv[]) {
	int optIndex=0;
	int daemonize = 0;
	while (( optIndex = getopt(argc, argv, "a::d:f:hlr::t:v:")) != -1) {
		DPRINTF("optindex='%c' optarg=%s\n", optIndex, optarg);
		switch (optIndex) {
			case 'a':
				if (optarg && *optarg) alsaname = optarg;
				break;
			case 'd':
				dur = atof(optarg); break;
			case 'f':
				freq = atof(optarg); break;
			case 'h':
				printf(HELP_TEXT, prog, alsaname, dur, freq,
						evlink, (kind?"square":"sine"), vol);
				return 0;
			case 'l':
				keepopen = 1;
				break;
			case 'r':
				if (optarg && *optarg) evdev = optarg;
				daemonize = 1;
				break;
			case 't':
				if(strncmp(optarg,"sine",5)==0) {kind=0;break;}
				if(strncmp(optarg,"square",7)==0) {kind=1;break;}
				printf("kind incorrect should be sine or square not %s\n", optarg);
				return 1;
			case 'v':
				vol = atof(optarg); break;
			default:
				printf("Option '%c' incorrect\n",optIndex);
				return 1;
		  }
	}

	if (daemonize) {
		pid_t pid = detach();
		if (pid>0) {
        	exit(0); // Parent process exits
		} else {
			printf("failed to detach\n");
			exit(1);
		}
	} else {
		beep();
	}

	return EXIT_SUCCESS;
}
