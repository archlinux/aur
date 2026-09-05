/*
 * MOC - music on console
 * Copyright (C) 2005, 2006 Damian Pietras <daper@daper.net>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * Based on FFplay Copyright (c) 2003 Fabrice Bellard
 *
 */

/*
 *		"The main problem is that external projects who want to
 *		 support both FFmpeg and LibAV are just fucked, and this
 *		 only because LibAV doesn't care a second about their users."
 *
 *		-- http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html
 */

/*
 * The following code was updated for FFmpeg 5.1+
 * (works with FFmpeg from 5.1 through 9.x, tested with FFmpeg 9.0.1).
 */

#ifdef HAVE_CONFIG_H
# include "config.h"
#endif

#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
#include <string.h>
#include <strings.h>
#include <assert.h>
#include <stdint.h>

#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavutil/mathematics.h>
#include <libavutil/opt.h>
#include <libavutil/channel_layout.h>

/* FFmpeg also likes common names, without that, our common.h and log.h
 * would not be included. */
#undef COMMON_H
#undef LOG_H

#define DEBUG

#define STRERROR_FN ffmpeg_strerror

#include "common.h"
#include "audio.h"
#include "decoder.h"
#include "log.h"
#include "files.h"
#include "lists.h"

/* Set SEEK_IN_DECODER to 1 if you'd prefer seeking to be delay until
 * the next time ffmpeg_decode() is called.  This will provide seeking
 * in formats for which FFmpeg falsely reports seek errors, but could
 * result erroneous current time values. */
#define SEEK_IN_DECODER 0

struct ffmpeg_data
{
	AVFormatContext *ic;
	AVIOContext *pb;
	AVStream *stream;
	AVCodecContext *enc;
	const AVCodec *codec;

	char *remain_buf;
	int remain_buf_len;

	bool delay;             /* FFmpeg may buffer samples */
	bool eof;               /* end of file seen */
	bool eos;               /* end of sound seen */
	bool okay;              /* was this stream successfully opened? */

	char *filename;
	struct io_stream *iostream;
	struct decoder_error error;
	long fmt;
	int sample_width;
	int bitrate;            /* in bits per second */
	int avg_bitrate;        /* in bits per second */
#if SEEK_IN_DECODER
	bool seek_req;          /* seek requested */
	int seek_sec;           /* second to which to seek */
#endif
	bool seek_broken;       /* FFmpeg seeking is broken */
	bool timing_broken;     /* FFmpeg trashes duration and bit_rate */
#if SEEK_IN_DECODER && defined(DEBUG)
	pthread_t thread_id;
#endif
};

struct extn_list {
	const char *extn;
	const char *format;
};

static lists_t_strs *supported_extns = NULL;

static void ffmpeg_log_repeats (char *msg LOGIT_ONLY)
{
#ifndef NDEBUG
	static int msg_count = 0;
	static char *prev_msg = NULL;
	static pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

	/* We need to gate the decoder and precaching threads. */
	LOCK (mutex);

	if (prev_msg && (!msg || strcmp (msg, prev_msg))) {
		if (msg_count > 1)
			logit ("FFmpeg said: Last message repeated %d times", msg_count);
		free (prev_msg);
		prev_msg = NULL;
		msg_count = 0;
	}
	if (prev_msg && msg) {
		free (msg);
		msg = NULL;
		msg_count += 1;
	}
	if (!prev_msg && msg) {
		int count, ix;
		lists_t_strs *lines;

		lines = lists_strs_new (4);
		count = lists_strs_split (lines, msg, "\n");
		for (ix = 0; ix < count; ix += 1)
			logit ("FFmpeg said: %s", lists_strs_at (lines, ix));
		lists_strs_free (lines);

		prev_msg = msg;
		msg_count = 1;
	}
	UNLOCK (mutex);
#endif
}

#ifndef NDEBUG
static void ffmpeg_log_cb (void *unused ATTR_UNUSED, int level,
                           const char *fmt, va_list vl)
{
	int len;
	char *msg;

	assert (fmt);

	if (level > av_log_get_level ())
		return;

	msg = format_msg_va (fmt, vl);

#if defined(HAVE_FFMPEG) && LIBAVFORMAT_VERSION_INT >= AV_VERSION_INT(56,33,101)
	/* Drop this message because it is issued repeatedly and is pointless. */
	const char skipping[] = "Skipping 0 bytes of junk";

	if (!strncmp (skipping, msg, sizeof (skipping) - 1)) {
		free (msg);
		return;
	}
#endif

	len = strlen (msg);
	for (len = strlen (msg); len > 0 && msg[len - 1] == '\n'; len -= 1)
		msg[len - 1] = 0x00;

	ffmpeg_log_repeats (msg);
}
#endif

/* FFmpeg-provided error code to description function wrapper. */
static inline char *ffmpeg_strerror (int errnum)
{
	char *result;

	ffmpeg_log_repeats (NULL);
	result = xmalloc (256);
	av_strerror (errnum, result, 256);
	result[255] = 0;

	return result;
}

/* Find the first audio stream and return its index, or nb_streams if
 * none found. */
static unsigned int find_first_audio (AVFormatContext *ic)
{
	unsigned int result;

	assert (ic);

	for (result = 0; result < ic->nb_streams; result += 1) {
		if (ic->streams[result]->codecpar->codec_type == AVMEDIA_TYPE_AUDIO)
			break;
	}

	return result;
}

static void load_audio_extns (lists_t_strs *list)
{
	int ix;

	/* When adding an entry to this list, tests need to be performed to
	 * determine whether or not FFmpeg/LibAV handles durations and seeking
	 * correctly.  If not, then the appropriate additions should be made
	 * in is_timing_broken() and is_seek_broken(). */
	const struct extn_list audio_extns[] = {
		{"aac", "aac"},
		{"ac3", "ac3"},
		{"ape", "ape"},
		{"au", "au"},
		{"ay", "libgme"},
		{"dff", "dsf"},
		{"dsf", "dsf"},
		{"dts", "dts"},
		{"eac3", "eac3"},
		{"fla", "flac"},
		{"flac", "flac"},
		{"gbs", "libgme"},
		{"gym", "libgme"},
		{"hes", "libgme"},
		{"kss", "libgme"},
		{"mka", "matroska"},
		{"mp2", "mpeg"},
		{"mp3", "mp3"},
		{"mpc", "mpc"},
		{"mpc8", "mpc8"},
		{"m4a", "m4a"},
		{"nsf", "libgme"},
		{"nsfe", "libgme"},
		{"ra", "rm"},
		{"sap", "libgme"},
		{"spc", "libgme"},
		{"tta", "tta"},
		{"vgm", "libgme"},
		{"vgz", "libgme"},
		{"vqf", "vqf"},
		{"wav", "wav"},
		{"w64", "w64"},
		{"wma", "asf"},
		{"wv", "wv"},
		{NULL, NULL}
	};

	for (ix = 0; audio_extns[ix].extn; ix += 1) {
		if (av_find_input_format (audio_extns[ix].format))
			lists_strs_append (list, audio_extns[ix].extn);
	}

	if (av_find_input_format ("ogg")) {
		lists_strs_append (list, "ogg");
		if (avcodec_find_decoder (AV_CODEC_ID_VORBIS))
			lists_strs_append (list, "oga");
		if (avcodec_find_decoder (AV_CODEC_ID_OPUS))
			lists_strs_append (list, "opus");
		if (avcodec_find_decoder (AV_CODEC_ID_THEORA))
			lists_strs_append (list, "ogv");
	}

	/* In theory, FFmpeg supports Speex if built with libspeex enabled.
	 * In practice, it breaks badly. */
#if 0
	if (avcodec_find_decoder (AV_CODEC_ID_SPEEX))
		lists_strs_append (list, "spx");
#endif
}

static void load_video_extns (lists_t_strs *list)
{
	int ix;
	const struct extn_list video_extns[] = {
		{"avi", "avi"},
		{"flv", "flv"},
		{"mkv", "matroska"},
		{"mp4", "mp4"},
		{"rec", "mpegts"},
		{"vob", "mpeg"},
		{"webm", "matroska"},
		{NULL, NULL}
	};

	for (ix = 0; video_extns[ix].extn; ix += 1) {
		if (av_find_input_format (video_extns[ix].format))
			lists_strs_append (list, video_extns[ix].extn);
	}
}

/* Here we attempt to determine if FFmpeg/LibAV has trashed the 'duration'
 * and 'bit_rate' fields in AVFormatContext for large files.  Determining
 * whether or not they are likely to be valid is imprecise and will vary
 * depending (at least) on:
 *
 * - The file's size,
 * - The file's codec,
 * - The number and size of tags,
 * - The version of FFmpeg/LibAV, and
 * - Whether it's FFmpeg or LibAV.
 *
 * This function represents a best guess.
*/
static bool is_timing_broken (AVFormatContext *ic)
{
	if (ic->duration < 0 || ic->bit_rate < 0)
		return true;

	/* If and when FFmpeg uses the right field for its calculation this
	 * should be self-correcting. */
	if (ic->duration < AV_TIME_BASE && !strcmp (ic->iformat->name, "libgme"))
		return true;

	/* AAC timing is inaccurate. */
	if (!strcmp (ic->iformat->name, "aac"))
		return true;

	/* Formats less than 4 GiB should be okay, except those excluded above. */
	if (avio_size (ic->pb) < UINT32_MAX)
		return false;

	/* WAV files are limited to 4 GiB but that doesn't stop some encoders. */
	if (!strcmp (ic->iformat->name, "wav"))
		return true;

	if (!strcmp (ic->iformat->name, "au"))
		return true;

	return false;
}

static void ffmpeg_init ()
{
#ifndef NDEBUG
# ifdef DEBUG
	av_log_set_level (AV_LOG_INFO);
# else
	av_log_set_level (AV_LOG_ERROR);
# endif
	av_log_set_callback (ffmpeg_log_cb);
#endif

	/* Removed calls to avcodec_register_all() and av_register_all(),
	 * since from FFmpeg 5.0 there is no need to register anything:
	 * codecs, formats and protocols are always available.  There is
	 * also no lock manager (av_lockmgr_register) to install any more. */

	supported_extns = lists_strs_new (16);
	load_audio_extns (supported_extns);
	load_video_extns (supported_extns);
}

static void ffmpeg_destroy ()
{
	av_log_set_level (AV_LOG_QUIET);
	ffmpeg_log_repeats (NULL);

	lists_strs_free (supported_extns);
}

/* Fill info structure with data from ffmpeg comments. */
static void ffmpeg_info (const char *file_name,
		struct file_tags *info,
		const int tags_sel)
{
	int err;
	AVFormatContext *ic = NULL;
	AVDictionaryEntry *entry;
	AVDictionary *md;

	err = avformat_open_input (&ic, file_name, NULL, NULL);
	if (err < 0) {
		log_errno ("avformat_open_input() failed", err);
		return;
	}

	err = avformat_find_stream_info (ic, NULL);
	if (err < 0) {
		log_errno ("avformat_find_stream_info() failed", err);
		goto end;
	}

	if (!is_timing_broken (ic) && tags_sel & TAGS_TIME) {
		info->time = -1;
		if (ic->duration != (int64_t)AV_NOPTS_VALUE && ic->duration >= 0)
			info->time = ic->duration / AV_TIME_BASE;
	}

	if (!(tags_sel & TAGS_COMMENTS))
		goto end;

	md = ic->metadata;
	if (md == NULL) {
		unsigned int audio_ix;

		audio_ix = find_first_audio (ic);
		if (audio_ix < ic->nb_streams)
			md = ic->streams[audio_ix]->metadata;
	}

	if (md == NULL) {
		debug ("no metadata found");
		goto end;
	}

	entry = av_dict_get (md, "track", NULL, 0);
	if (entry && entry->value && entry->value[0])
		info->track = atoi (entry->value);
	entry = av_dict_get (md, "title", NULL, 0);
	if (entry && entry->value && entry->value[0])
		info->title = xstrdup (entry->value);
	entry = av_dict_get (md, "artist", NULL, 0);
	if (entry && entry->value && entry->value[0])
		info->artist = xstrdup (entry->value);
	entry = av_dict_get (md, "album", NULL, 0);
	if (entry && entry->value && entry->value[0])
		info->album = xstrdup (entry->value);

end:
	avformat_close_input (&ic);
	ffmpeg_log_repeats (NULL);
}

static long fmt_from_sample_fmt (struct ffmpeg_data *data)
{
	long result;

	switch (data->enc->sample_fmt) {
	case AV_SAMPLE_FMT_U8:
	case AV_SAMPLE_FMT_U8P:
		result = SFMT_U8;
		break;
	case AV_SAMPLE_FMT_S16:
	case AV_SAMPLE_FMT_S16P:
		result = SFMT_S16;
		break;
	case AV_SAMPLE_FMT_S32:
	case AV_SAMPLE_FMT_S32P:
		result = SFMT_S32;
		break;
	case AV_SAMPLE_FMT_FLT:
	case AV_SAMPLE_FMT_FLTP:
		result = SFMT_FLOAT;
		break;
	default:
		result = 0;
	}

	return result;
}

/* Try to figure out if seeking is broken for this format.
 * The aim here is to try and ensure that seeking either works
 * properly or (because of FFmpeg breakages) is disabled. */
static bool is_seek_broken (struct ffmpeg_data *data)
{
#if 0
	/* FFmpeg's alternate strategy for formats which don't
	 * support seeking natively seems to be... unreliable. */
	if (!data->ic->iformat->read_seek) {
		debug ("Seek broken by AVInputFormat.read_seek");
		return true;
	}
#endif

	/* How much do we trust this? */
	if (!data->ic->pb->seekable) {
		debug ("Seek broken by AVIOContext.seekable");
		return true;
	}

#if !SEEK_IN_DECODER
	/* FLV (.flv): av_seek_frame always returns an error (even on success).
	 *             Seeking from the decoder works for false errors (but
	 *             probably not for real ones) because the player doesn't
	 *             get to see them. */
	if (avcodec_version () < AV_VERSION_INT(55,8,100))
	{
		if (!strcmp (data->ic->iformat->name, "flv"))
			return true;
	}
#endif

	return false;
}

/* Downmix multi-channel audio to stereo.
 * The old AVCodecContext.request_channel_layout option is gone; its designated
 * replacement is the "downmix" codec private option.  Decoders that do
 * not implement it will simply ignore the request. */
static void set_downmixing (struct ffmpeg_data *data)
{
	if (data->enc->ch_layout.nb_channels <= 2)
		return;

	av_opt_set (data->enc, "downmix", "stereo", AV_OPT_SEARCH_CHILDREN);
}

static int ffmpeg_io_read_cb (void *s, uint8_t *buf, int count)
{
	if (!buf || count == 0)
		return 0;

	return io_read ((struct io_stream *)s, buf, (size_t)count);
}

static int64_t ffmpeg_io_seek_cb (void *s, int64_t offset, int whence)
{
	int w;
	int64_t result = -1;

	/* Warning: Do not blindly accept the avio.h comments for AVSEEK_FORCE
	 *          and AVSEEK_SIZE; they are incorrect for later FFmpeg/LibAV
	 *          versions. */

	w = whence & ~AVSEEK_FORCE;

	switch (w) {
	case SEEK_SET:
	case SEEK_CUR:
	case SEEK_END:
		result = io_seek ((struct io_stream *)s, offset, w);
		break;
	case AVSEEK_SIZE:
		result = io_file_size ((struct io_stream *)s);
		break;
	}

	return result;
}

static struct ffmpeg_data *ffmpeg_make_data (void)
{
	struct ffmpeg_data *data;

	data = (struct ffmpeg_data *)xmalloc (sizeof (struct ffmpeg_data));

	data->ic = NULL;
	data->pb = NULL;
	data->stream = NULL;
	data->enc = NULL;
	data->codec = NULL;
	data->remain_buf = NULL;
	data->remain_buf_len = 0;
	data->delay = false;
	data->eof = false;
	data->eos = false;
	data->okay = false;
	data->filename = NULL;
	data->iostream = NULL;
	decoder_error_init (&data->error);
	data->fmt = 0;
	data->sample_width = 0;
	data->bitrate = 0;
	data->avg_bitrate = 0;
#if SEEK_IN_DECODER
	data->seek_req = false;
	data->seek_sec = 0;
#endif
	data->seek_broken = false;
	data->timing_broken = false;
#if SEEK_IN_DECODER && defined(DEBUG)
	data->thread_id = 0;
#endif

	return data;
}

static void *ffmpeg_open_internal (struct ffmpeg_data *data)
{
	int err;
	const char *extn = NULL;
	unsigned int audio_ix;

	data->ic = avformat_alloc_context ();
	if (!data->ic)
		fatal ("Can't allocate format context!");

	data->ic->pb = avio_alloc_context (NULL, 0, 0, data->iostream,
	                                   ffmpeg_io_read_cb, NULL,
	                                   ffmpeg_io_seek_cb);
	if (!data->ic->pb)
		fatal ("Can't allocate avio context!");

	/* Save AVIO context pointer so we can workaround an FFmpeg
	 * memory leak later in ffmpeg_close(). */
	data->pb = data->ic->pb;

	err = avformat_open_input (&data->ic, NULL, NULL, NULL);
	if (err < 0) {
		char *buf = ffmpeg_strerror (err);
		decoder_error (&data->error, ERROR_FATAL, 0,
		               "Can't open audio: %s", buf);
		free (buf);
		return data;
	}

	/* When FFmpeg misidentifies a file's codec (and it does)
	 * then hopefully this will save MOC from wanton destruction. */
	if (data->filename) {
		extn = ext_pos (data->filename);
		if (extn && !strcasecmp (extn, "wav")
		         && strcmp (data->ic->iformat->name, "wav")) {
			decoder_error (&data->error, ERROR_FATAL, 0,
			               "Format possibly misidentified "
			               "as '%s' by FFmpeg/LibAV",
			               data->ic->iformat->name);
			goto end;
		}
	}

	err = avformat_find_stream_info (data->ic, NULL);
	if (err < 0) {
		/* Depending on the particular FFmpeg/LibAV version in use, this
		 * may misreport experimental codecs.  Given we don't know the
		 * codec at this time, we will have to live with it. */
		char *buf = ffmpeg_strerror (err);
		decoder_error (&data->error, ERROR_FATAL, 0,
				"Could not find codec parameters: %s", buf);
		free (buf);
		goto end;
	}

	audio_ix = find_first_audio (data->ic);
	if (audio_ix == data->ic->nb_streams) {
		decoder_error (&data->error, ERROR_FATAL, 0, "No audio in source");
		goto end;
	}

	data->stream = data->ic->streams[audio_ix];

	/* Demuxers no longer embed a decoder context:
	 * build one from the stream's codec parameters. */
	data->enc = avcodec_alloc_context3 (NULL);
	if (!data->enc)
		fatal ("Can't allocate codec context!");

	err = avcodec_parameters_to_context (data->enc, data->stream->codecpar);
	if (err < 0) {
		decoder_error (&data->error, ERROR_FATAL, 0,
		               "Could not fill codec context");
		goto end;
	}

	data->codec = avcodec_find_decoder (data->enc->codec_id);
	if (!data->codec) {
		decoder_error (&data->error, ERROR_FATAL, 0, "No codec for this audio");
		goto end;
	}

	if (data->filename) {
		const char *fn;

		fn = strrchr (data->filename, '/');
		fn = fn ? fn + 1 : data->filename;
		debug ("FFmpeg thinks '%s' is format(codec) '%s(%s)'",
		        fn, data->ic->iformat->name, data->codec->name);
	}
	else
		debug ("FFmpeg thinks stream is format(codec) '%s(%s)'",
		        data->ic->iformat->name, data->codec->name);

	if (data->codec->capabilities & AV_CODEC_CAP_EXPERIMENTAL) {
		decoder_error (&data->error, ERROR_FATAL, 0,
				"The codec is experimental and may damage MOC: %s",
				data->codec->name);
		goto end;
	}

	set_downmixing (data);

	if (avcodec_open2 (data->enc, data->codec, NULL) < 0)
	{
		decoder_error (&data->error, ERROR_FATAL, 0, "No codec for this audio");
		goto end;
	}

	data->fmt = fmt_from_sample_fmt (data);
	if (data->fmt == 0) {
		decoder_error (&data->error, ERROR_FATAL, 0,
		               "Cannot get sample size from unknown sample format: %s",
		               av_get_sample_fmt_name (data->enc->sample_fmt));
		goto end;
	}

	data->sample_width = sfmt_Bps (data->fmt);

	if (data->codec->capabilities & AV_CODEC_CAP_DELAY)
		data->delay = true;
	data->seek_broken = is_seek_broken (data);
	data->timing_broken = is_timing_broken (data->ic);

	if (data->timing_broken && extn && !strcasecmp (extn, "wav")) {
		ffmpeg_log_repeats (NULL);
		decoder_error (&data->error, ERROR_FATAL, 0,
		                   "Broken WAV file; use W64!");
		goto end;
	}

	data->okay = true;

	if (!data->timing_broken && data->ic->duration >= AV_TIME_BASE)
		data->avg_bitrate = (int) (avio_size (data->ic->pb) /
		                           (data->ic->duration / AV_TIME_BASE) * 8);

	if (!data->timing_broken && data->ic->bit_rate > 0)
		data->bitrate = data->ic->bit_rate;

	return data;

end:
	if (data->enc)
		avcodec_free_context (&data->enc);
	avformat_close_input (&data->ic);
	ffmpeg_log_repeats (NULL);
	return data;
}

static void *ffmpeg_open (const char *file)
{
	struct ffmpeg_data *data;

	data = ffmpeg_make_data ();

	data->filename = xstrdup (file);
	data->iostream = io_open (file, 1);
	if (!io_ok (data->iostream)) {
		decoder_error (&data->error, ERROR_FATAL, 0,
		               "Can't open file: %s", io_strerror (data->iostream));
		return data;
	}

	return ffmpeg_open_internal (data);
}

static void *ffmpeg_open_stream (struct io_stream *stream)
{
	struct ffmpeg_data *data;

	data = ffmpeg_make_data ();

	data->iostream = stream;

	return ffmpeg_open_internal (data);
}

static int ffmpeg_can_decode (struct io_stream *stream)
{
	int res;
	AVProbeData probe_data;
	const AVInputFormat *fmt;
	char buf[8096 + AVPROBE_PADDING_SIZE] = {0};

	res = io_peek (stream, buf, sizeof (buf));
	if (res < 0) {
		error ("Stream error: %s", io_strerror (stream));
		return 0;
	}

	probe_data.filename = NULL;
	probe_data.buf = (unsigned char*)buf;
	probe_data.buf_size = sizeof (buf) - AVPROBE_PADDING_SIZE;
#ifdef HAVE_STRUCT_AVPROBEDATA_MIME_TYPE
	probe_data.mime_type = NULL;
#endif

	fmt = av_probe_input_format (&probe_data, 1);

	return fmt != NULL;
}

static void put_in_remain_buf (struct ffmpeg_data *data, const char *buf,
		const int len)
{
	debug ("Remain: %dB", len);

	data->remain_buf_len = len;
	data->remain_buf = (char *)xmalloc (len);
	memcpy (data->remain_buf, buf, len);
}

static void add_to_remain_buf (struct ffmpeg_data *data, const char *buf,
		const int len)
{
	debug ("Adding %dB to remain_buf", len);

	data->remain_buf = (char *)xrealloc (data->remain_buf,
			data->remain_buf_len + len);
	memcpy (data->remain_buf + data->remain_buf_len, buf, len);
	data->remain_buf_len += len;

	debug ("remain_buf is %dB long", data->remain_buf_len);
}

/* Free the remainder buffer. */
static void free_remain_buf (struct ffmpeg_data *data)
{
	free (data->remain_buf);
	data->remain_buf = NULL;
	data->remain_buf_len = 0;
}

/* Satisfy the request from previously decoded samples. */
static int take_from_remain_buf (struct ffmpeg_data *data, char *buf, int buf_len)
{
	int to_copy = MIN (buf_len, data->remain_buf_len);

	debug ("Copying %d bytes from the remain buf", to_copy);

	memcpy (buf, data->remain_buf, to_copy);

	if (to_copy < data->remain_buf_len) {
		memmove (data->remain_buf, data->remain_buf + to_copy,
				data->remain_buf_len - to_copy);
		data->remain_buf_len -= to_copy;
	}
	else {
		debug ("Remain buf is now empty");
		free_remain_buf (data);
	}

	return to_copy;
}

/* Copy samples to output or remain buffer. */
static int copy_or_buffer (struct ffmpeg_data *data, char *in, int in_len,
                                                     char *out, int out_len)
{
	if (in_len == 0)
		return 0;

	if (in_len <= out_len) {
		memcpy (out, in, in_len);
		return in_len;
	}

	if (out_len == 0) {
		add_to_remain_buf (data, in, in_len);
		return 0;
	}

	memcpy (out, in, out_len);
	put_in_remain_buf (data, in + out_len, in_len - out_len);
	return out_len;
}

/* Convert a decoded frame to packed (interleaved) samples and
 * hand them over to copy_or_buffer(). */
static int move_frame_samples (struct ffmpeg_data *data, AVFrame *frame,
                               char *buf, int buf_len)
{
	int is_planar, packed_size, copied;
	char *packed;
	int channels = data->enc->ch_layout.nb_channels;

	is_planar = av_sample_fmt_is_planar (data->enc->sample_fmt);
	packed = (char *)frame->extended_data[0];
	packed_size = frame->nb_samples * data->sample_width * channels;

	if (is_planar && channels > 1) {
		int sample, ch;

		packed = xmalloc (packed_size);

		for (sample = 0; sample < frame->nb_samples; sample += 1) {
			for (ch = 0; ch < channels; ch += 1)
				memcpy (packed + (sample * channels + ch)
				                         * data->sample_width,
				        (char *)frame->extended_data[ch]
				                        + sample * data->sample_width,
				        data->sample_width);
		}
	}

	copied = copy_or_buffer (data, packed, packed_size, buf, buf_len);

	if (packed != (char *)frame->extended_data[0])
		free (packed);

	return copied;
}

/* Decode samples from packet data using the send/receive API.
 * The packet may be empty (data == NULL) to flush the decoder's
 * buffered samples at the end of the file. */
static int decode_packet (struct ffmpeg_data *data, AVPacket *pkt,
                          char *buf, int buf_len)
{
	int filled = 0;
	int rc;
	AVFrame *frame;

	frame = av_frame_alloc ();

	rc = avcodec_send_packet (data->enc, pkt->data ? pkt : NULL);
	if (rc < 0 && rc != AVERROR (EAGAIN)) {
		decoder_error (&data->error, ERROR_STREAM, 0,
		               "Error in the stream!");
		av_frame_free (&frame);
		return 0;
	}

	while (true) {
		rc = avcodec_receive_frame (data->enc, frame);
		if (rc == AVERROR (EAGAIN) || rc == AVERROR_EOF) {
			if (rc == AVERROR_EOF && data->eof && pkt->data == NULL)
				data->eos = true;
			break;
		}
		if (rc < 0) {
			/* skip frame */
			decoder_error (&data->error, ERROR_STREAM, 0,
			               "Error in the stream!");
			break;
		}

		if (frame->nb_samples > 0) {
			int copied;

			copied = move_frame_samples (data, frame, buf, buf_len);
			buf += copied;
			filled += copied;
			buf_len -= copied;

			debug ("Copying %dB (%dB filled)", copied, filled);
		}

		av_frame_unref (frame);
	}

	av_frame_free (&frame);

	return filled;
}

/* Create a new packet ('cause FFmpeg doesn't provide one). */
static inline AVPacket *new_packet (struct ffmpeg_data *data)
{
	AVPacket *pkt;

	assert (data->stream);

	pkt = av_packet_alloc ();
	if (!pkt)
		fatal ("av_packet_alloc() failed to allocate memory");

	pkt->stream_index = data->stream->index;

	return pkt;
}

static inline void free_packet (AVPacket *pkt)
{
	av_packet_free (&pkt);
}

/* Read a packet from the file or empty packet if flushing delayed
 * samples. */
static AVPacket *get_packet (struct ffmpeg_data *data)
{
	int rc;
	AVPacket *pkt;

	assert (data);
	assert (!data->eos);

	pkt = new_packet (data);

	if (data->eof)
		return pkt;

	rc = av_read_frame (data->ic, pkt);
	if (rc >= 0) {
		debug ("Got %dB packet", pkt->size);
		return pkt;
	}

	free_packet (pkt);

	/* FFmpeg has (at least) two ways of indicating EOF.  (Awesome!) */
	if (rc == AVERROR_EOF)
		data->eof = true;
	if (data->ic->pb && data->ic->pb->eof_reached)
		data->eof = true;

	if (!data->eof && rc < 0) {
		char *buf = ffmpeg_strerror (rc);
		decoder_error (&data->error, ERROR_FATAL, 0,
		               "Error in the stream: %s", buf);
		free (buf);
		return NULL;
	}

	if (data->delay)
		return new_packet (data);

	data->eos = true;
	return NULL;
}

#if SEEK_IN_DECODER
static bool seek_in_stream (struct ffmpeg_data *data)
#else
static bool seek_in_stream (struct ffmpeg_data *data, int sec)
#endif
{
	int rc, flags = AVSEEK_FLAG_BACKWARD;
	int64_t seek_ts;

#if SEEK_IN_DECODER
	int sec = data->seek_sec;

#ifdef DEBUG
	assert (pthread_equal (data->thread_id, pthread_self ()));
#endif
#endif

	/* FFmpeg can't seek if the file has already reached EOF. */
	if (data->eof)
		return false;

	seek_ts = av_rescale (sec, data->stream->time_base.den,
	                           data->stream->time_base.num);

	if (data->stream->start_time != (int64_t)AV_NOPTS_VALUE) {
		if (seek_ts > INT64_MAX - data->stream->start_time) {
			logit ("Seek value too large");
			return false;
		}
		seek_ts += data->stream->start_time;
	}

	/* AVStream.cur_dts is no longer exported, so we can't compare the
	 * seek target with the current position; always seek backwards to
	 * the preceding sync point. */
	rc = av_seek_frame (data->ic, data->stream->index, seek_ts, flags);
	if (rc < 0) {
		log_errno ("Seek error", rc);
		return false;
	}

	avcodec_flush_buffers (data->enc);

	return true;
}

static inline int compute_bitrate (struct sound_params *sound_params,
                                   int bytes_used, int bytes_produced,
                                   int bitrate)
{
	int64_t bytes_per_frame, bytes_per_second, seconds;

	bytes_per_frame = sfmt_Bps (sound_params->fmt) * sound_params->channels;
	bytes_per_second = bytes_per_frame * (int64_t)sound_params->rate;
	seconds = (int64_t)bytes_produced / bytes_per_second;
	if (seconds > 0)
		bitrate = (int)((int64_t)bytes_used * 8 / seconds);

	return bitrate;
}

static int ffmpeg_decode (void *prv_data, char *buf, int buf_len,
                          struct sound_params *sound_params)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;
	int bytes_used = 0, bytes_produced = 0;

	decoder_error_clear (&data->error);

	if (data->eos)
		return 0;

	/* FFmpeg claims to always return native endian. */
	sound_params->channels = data->enc->ch_layout.nb_channels;
	sound_params->rate = data->enc->sample_rate;
	sound_params->fmt = data->fmt | SFMT_NE;

#if SEEK_IN_DECODER
	if (data->seek_req) {
		data->seek_req = false;
		if (seek_in_stream (data))
			free_remain_buf (data);
	}
#endif

	if (data->remain_buf)
		return take_from_remain_buf (data, buf, buf_len);

	do {
		AVPacket *pkt;

		pkt = get_packet (data);
		if (!pkt)
			break;

		if (pkt->stream_index != data->stream->index) {
			free_packet (pkt);
			continue;
		}

#ifdef AV_PKT_FLAG_CORRUPT
		if (pkt->flags & AV_PKT_FLAG_CORRUPT) {
			ffmpeg_log_repeats (NULL);
			debug ("Dropped corrupt packet.");
			free_packet (pkt);
			continue;
		}
#endif

		bytes_used += pkt->size;

		bytes_produced = decode_packet (data, pkt, buf, buf_len);
		buf += bytes_produced;
		buf_len -= bytes_produced;

		free_packet (pkt);
	} while (!bytes_produced && !data->eos);

	if (!data->timing_broken)
		data->bitrate = compute_bitrate (sound_params, bytes_used,
		                                 bytes_produced + data->remain_buf_len,
		                                 data->bitrate);

	return bytes_produced;
}

static int ffmpeg_seek (void *prv_data, int sec)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	assert (sec >= 0);

	if (data->seek_broken)
		return -1;

#if SEEK_IN_DECODER

	data->seek_sec = sec;
	data->seek_req = true;
#ifdef DEBUG
	data->thread_id = pthread_self ();
#endif

#else

	if (!seek_in_stream (data, sec))
		return -1;

	free_remain_buf (data);

#endif

	return sec;
}

static void ffmpeg_close (void *prv_data)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	/* We need to delve into the AVIOContext struct to free the
	 * buffer FFmpeg leaked if avformat_open_input() failed.  Do
	 * not be tempted to call avio_close() here; it will segfault. */
	if (data->pb) {
		av_freep (&data->pb->buffer);
		av_freep (&data->pb);
	}

	if (data->okay) {
		avcodec_free_context (&data->enc);
		avformat_close_input (&data->ic);
		free_remain_buf (data);
	}

	ffmpeg_log_repeats (NULL);

	if (data->iostream) {
		io_close (data->iostream);
		data->iostream = NULL;
	}

	decoder_error_clear (&data->error);
	free (data->filename);
	free (data);
}

static struct io_stream *ffmpeg_get_iostream (void *prv_data)
{
	struct ffmpeg_data *data;

	assert (prv_data);

	data = (struct ffmpeg_data *)prv_data;
	return data->iostream;
}

static int ffmpeg_get_bitrate (void *prv_data)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	return data->timing_broken ? -1 : data->bitrate / 1000;
}

static int ffmpeg_get_avg_bitrate (void *prv_data)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	return data->timing_broken ? -1 : data->avg_bitrate / 1000;
}

static int ffmpeg_get_duration (void *prv_data)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	if (data->timing_broken)
		return -1;

	if (!data->stream)
		return -1;

	if (data->stream->duration == (int64_t)AV_NOPTS_VALUE)
		return -1;

	if (data->stream->duration < 0)
		return -1;

	return data->stream->duration * data->stream->time_base.num
	                              / data->stream->time_base.den;
}

static int ffmpeg_our_format_ext (const char *ext)
{
	return (lists_strs_exists (supported_extns, ext)) ? 1 : 0;
}

static int ffmpeg_our_format_mime (const char *mime_type)
{
	const AVOutputFormat *fmt;

	fmt = av_guess_format (NULL, NULL, mime_type);
	return fmt ? 1 : 0;
}

static void ffmpeg_get_error (void *prv_data, struct decoder_error *error)
{
	struct ffmpeg_data *data = (struct ffmpeg_data *)prv_data;

	decoder_error_copy (error, &data->error);
}

static struct decoder ffmpeg_decoder = {
	DECODER_API_VERSION,
	ffmpeg_init,
	ffmpeg_destroy,
	ffmpeg_open,
	ffmpeg_open_stream,
	ffmpeg_can_decode,
	ffmpeg_close,
	ffmpeg_decode,
	ffmpeg_seek,
	ffmpeg_info,
	ffmpeg_get_bitrate,
	ffmpeg_get_duration,
	ffmpeg_get_error,
	ffmpeg_our_format_ext,
	ffmpeg_our_format_mime,
	NULL,
	NULL,
	ffmpeg_get_iostream,
	ffmpeg_get_avg_bitrate
};

struct decoder *plugin_init ()
{
	return &ffmpeg_decoder;
}
