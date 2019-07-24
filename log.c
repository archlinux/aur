/*
 * Copyright (c) 2017 rxi
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to
 * deal in the Software without restriction, including without limitation the
 * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
 * sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

#include <pthread.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "log.h"

#ifdef WIN32
#include <windows.h>
#endif

pthread_mutex_t m = PTHREAD_MUTEX_INITIALIZER;

static struct {
	FILE* fp;
	int level;
	int quiet;
} L;

static const char* level_names[] = {
	"TRACE", "DEBUG", "INFO", "WARN", "ERROR", "FATAL"
};

#ifdef LOG_USE_COLOR
#ifdef WIN32
static const WORD level_colors[] = {
	10, 11, 10, 6, 12, 12
};
#else
static const char* level_colors[] = {
	"\x1b[94m", "\x1b[36m", "\x1b[32m", "\x1b[33m", "\x1b[31m", "\x1b[35m"
};
#endif
#endif

static void lock(void)  {
	pthread_mutex_lock(&m);
}

static void unlock(void)  {
	pthread_mutex_unlock(&m);
}

void log_set_fp(FILE* fp) {
	L.fp = fp;
}

void log_set_level(int level) {
	L.level = level;
}

void log_set_quiet(int enable) {
	L.quiet = enable ? 1 : 0;
}

void log_log(int level, const char* file, int line, const char* fmt, ...) {
	if(level < L.level)
		return;

	/* Get current time */
	time_t t = time(NULL);
	struct tm* lt = localtime(&t);

	/* Acquire lock */
	lock();

	/* Log to stderr */
	if(!L.quiet) {
		va_list args;
		char buf[16];
		buf[strftime(buf, sizeof(buf), "%H:%M:%S", lt)] = '\0';

		#ifdef LOG_USE_COLOR
			#ifdef WIN32
				HANDLE hConsole = GetStdHandle(STD_OUTPUT_HANDLE);
				CONSOLE_SCREEN_BUFFER_INFO consoleInfo;
				WORD saved_attributes;

				GetConsoleScreenBufferInfo(hConsole, &consoleInfo);
				saved_attributes = consoleInfo.wAttributes;

				// Force set to grey for this purpose, but keep the previous colour settings and revert
				// back to them after the logging has completed, since the user who may have changed colours
				// for their own logging prior to log_log called
				SetConsoleTextAttribute(hConsole, 7);
				fprintf(stderr, "%s ", buf);
				SetConsoleTextAttribute(hConsole, level_colors[level]);
				fprintf(stderr, "%s", level_names[level]);

				if (strlen(level_names[level]) == 5) {
					fprintf(stderr, " ");
				} else {
					fprintf(stderr, "  ");
				}
				SetConsoleTextAttribute(hConsole, 8 /*GREY*/);
				fprintf(stderr, "%s:%d: ", file, line);

				// Revert back colour settings
				SetConsoleTextAttribute(hConsole, saved_attributes);
			#else
				fprintf(
					stderr, "%s %s%-5s\x1b[0m \x1b[90m%s:%d:\x1b[0m ",
					buf, level_colors[level], level_names[level], file, line);
			#endif
		#else
			fprintf(stderr, "%s %-5s %s:%d: ", buf, level_names[level], file, line);
		#endif
		va_start(args, fmt);
		vfprintf(stderr, fmt, args);
		va_end(args);
		fprintf(stderr, "\n");
	}

	/* Log to file */
	if(L.fp) {
		va_list args;
		char buf[32];
		buf[strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", lt)] = '\0';
		fprintf(L.fp, "%s %-5s %s:%d: ", buf, level_names[level], file, line);
		va_start(args, fmt);
		vfprintf(L.fp, fmt, args);
		va_end(args);
		fprintf(L.fp, "\n");
	}

	/* Release lock */
	unlock();
}
