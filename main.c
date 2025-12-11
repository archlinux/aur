#include <alsa/asoundlib.h>

int main() {
  snd_pcm_t *pcm_handle;
  snd_pcm_hw_params_t *params;
  unsigned int sample_rate = 44100;
  int channels = 2;

  snd_pcm_open(&pcm_handle, "default", SND_PCM_STREAM_PLAYBACK, 0);

  snd_pcm_hw_params_alloca(&params);
  snd_pcm_hw_params_any(pcm_handle, params);
  snd_pcm_hw_params_set_access(pcm_handle, params,
                               SND_PCM_ACCESS_RW_INTERLEAVED);
  snd_pcm_hw_params_set_format(pcm_handle, params, SND_PCM_FORMAT_S16_LE);
  snd_pcm_hw_params_set_channels(pcm_handle, params, channels);
  snd_pcm_hw_params_set_rate_near(pcm_handle, params, &sample_rate, 0);
  snd_pcm_hw_params(pcm_handle, params);

  snd_pcm_uframes_t frames;
  snd_pcm_hw_params_get_period_size(params, &frames, 0);

  int buffer_size = frames * channels * 2;
  char *buffer = (char *)calloc(buffer_size, 1);

  while (1) {
    snd_pcm_writei(pcm_handle, buffer, frames);
    sleep(10);
  }

  free(buffer);
  snd_pcm_close(pcm_handle);
  return 0;
}