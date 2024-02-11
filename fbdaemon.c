/*
 * File: fbdaemon.c
 * Tone generator for alsa audio api
 * based on alsatonic by Coolbrother
 * */

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
static float buffer[BUF_LEN];
static snd_pcm_t *g_handle;
static snd_pcm_sframes_t g_frames;
static int channels =1;
static snd_pcm_format_t format = SND_PCM_FORMAT_FLOAT;
static int rate = 48000;
static float freq = DEF_FREQ; // in hertz
static float dur = DEF_DUR; // in seconds
static int kind = 1; //0 for sine 1 for square wave
static float vol = 0.025F;
static const char *fbdevpath="/dev/beep";
static const char *prog;
static const char *device = "default";

#define HELP_TEXT "%s Usage:\n\
  -a dev   : use alsa device dev (default '%s')\n\
  -d dur   : set duration in seconds (default: %.2f)\n\
  -f freq  : set frequency in HZ, and play it. (default: %.0fHZ)\n\
  -h       : print this Help\n\
  -t kind  : sine or square wave (default square)\n\
  -v vol   : volume (default %.3f)\n\
  -r path  : daemonize and beep on reads of path (default '%s')\n\
\n\
%s is a simple alsa beep daemon designed to work with the fancybeep\n\
kernel module, normally started via /etc/udev/rules.d/90-fancybeep.rules\n\
other daemons can be used with fancybeep see eg\n\
https://github.com/mozzwald/Fancy-Beeper-Daemon/tree/master/daemons\n\n"

static void genSine() {
	float t = 2*M_PI*freq/(rate*channels);
	float *buf = buffer;
	for (int i=0; i< BUF_LEN; i++) {
		// val = (int)maxSamp*vol*sin(t*i);
		buffer[i] = vol*sin(t*i);
	}
}

static void genSquare(){
	int full_cycle = floorf((float)(rate*channels)/freq),
		half_cycle = floorf((float)full_cycle / 2.0f),
		cycle_index = 0;
	for (int i = 0; i < BUF_LEN; i++) {
		buffer[i] = (cycle_index < half_cycle) ? vol : -vol;
		cycle_index = (cycle_index + 1) % full_cycle;
		}
}

static void openDevice(){
	// open sound device and set params
	snd_output_t *output = NULL;
	int err;

	if ((err = snd_pcm_open(&g_handle, device, SND_PCM_STREAM_PLAYBACK, 0)) < 0) {
		fprintf(stderr, "%s: Playback open error: %s\n", prog, snd_strerror(err));
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
		fprintf(stderr, "%s: Playback open error: %s\n", prog, snd_strerror(err));
		exit(EXIT_FAILURE);
	}

}

static void closeDevice() {
	// closing sound device
	// necessary to flush and send short sample
	snd_pcm_drain(g_handle);
	snd_pcm_close(g_handle);
}

static void writeBuf(float* buf, int nbFrames, int nbTimes) {
	for (int i=0; i < nbTimes; i++) {
		// Sending the sound
		g_frames += snd_pcm_writei(g_handle, buf, nbFrames);
	}
	// printf("WriteBuf nbFrames: %d\n", g_frames);
}

static void playFreq() {
	// playing one freq
	int nbSamples = rate * channels * dur;
	int nbTimes = nbSamples / BUF_LEN;
	int restFrames = nbSamples % BUF_LEN;
	// printf("restFrames: %d\n", restFrames);
	if (nbSamples >0) {
		(kind==0?genSine:genSquare)();
		if (nbTimes >0) {
			writeBuf(buffer, BUF_LEN, nbTimes);	
		}
		if (restFrames > 0) {
			writeBuf(buffer, restFrames, 1);
		}
	
	}
	// printf("nbFrames: %d\n", g_frames);
}

static void beep(){
	openDevice();
 
	//printf("Playing %s %.3fHz during %.3f secs with vol=%.3f\n", (kind?"square":"sine"), freq, dur, vol);
	playFreq();
	//printf("nbFrames played: %d\n", g_frames);

	closeDevice();
}

// Function to handle termination signals
void sigterm_handler(int sig) {
    exit(0);
}

pid_t detach(void) {
    // Set up signal handler
    signal(SIGTERM, sigterm_handler);

    // Create a child process to become the daemon
    pid_t pid = fork();

    if (pid < 0) {
        perror("fork");
        exit(1);
    }

    if (pid > 0) return pid;

    // Child process continues as the daemon

    // Change working directory to avoid file system clutter
    if (chdir("/") != 0) {
        perror("chdir");
        exit(1);
    }

	int bno = open(fbdevpath,O_RDONLY);
	if (bno < 0) {
        perror("beep open");
		exit(1);
	}

    // Close standard input, output, and error
    close(STDIN_FILENO);
    close(STDOUT_FILENO);
    close(STDERR_FILENO);

	int c;
	size_t n;

    // Main loop for handling server logic
    while (1) {
        // Replace this with your actual server logic
        // (e.g., reading from /dev/beep, processing data, etc.)
		n = read(bno,&c,1);
		if (n==1) {
			beep();
		} else {
			perror("read failed");
			exit(1);
		}
    }
	return 0;
}

int main(int argc, char *argv[]) {
	int optIndex=0;
	int daemonize = 0;
	prog = strrchr(argv[0],'/');
	prog = prog? prog+1: "fbdaemon";
	while (( optIndex = getopt(argc, argv, "a::d:f:hr::t:v:")) != -1) {
		switch (optIndex) {
			case 'a':
				if (optarg && *optarg) {
					device = optarg;
				}
			case 'd':
				dur = atof(optarg); break;
			case 'f':
				freq = atof(optarg); break;
			case 'h':
				printf(HELP_TEXT, prog, device, dur, freq, vol, fbdevpath, prog);
				return 0;
			case 't':
				if(strncmp(optarg,"sine",5)==0) break;
				if(strncmp(optarg,"square",7)==0) {kind=1;break;}
				printf("kind incorrect should be sine or square not %s\n", optarg);
				return 1;
			case 'v':
				vol = atof(optarg); break;
			case 'r':
				daemonize = 1;
				if (optarg && *optarg) fbdevpath = optarg;
				break;
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
