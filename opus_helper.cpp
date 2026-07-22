#include <ogg/ogg.h>
#include <opus/opus.h>

#include <chrono>
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <cstring>
#include <fstream>
#include <iterator>
#include <random>
#include <string>
#include <vector>

#define EXPORT extern "C" __attribute__((visibility("default")))

namespace {

struct WavData {
  int sample_rate = 0;
  int channels = 0;
  int bits = 0;
  int format = 0;
  std::vector<float> mono;
};

uint16_t le16(const uint8_t *p) { return uint16_t(p[0]) | (uint16_t(p[1]) << 8); }
uint32_t le32(const uint8_t *p) { return uint32_t(p[0]) | (uint32_t(p[1]) << 8) | (uint32_t(p[2]) << 16) | (uint32_t(p[3]) << 24); }
void put16(uint8_t *p, uint16_t value) { p[0] = value & 255; p[1] = value >> 8; }
void put32(uint8_t *p, uint32_t value) { for (int i = 0; i < 4; ++i) p[i] = (value >> (i * 8)) & 255; }

bool parse_wav(const uint8_t *bytes, size_t size, WavData &wav) {
  if (!bytes || size < 44 || std::memcmp(bytes, "RIFF", 4) || std::memcmp(bytes + 8, "WAVE", 4)) return false;
  const uint8_t *pcm = nullptr;
  size_t pcm_size = 0;
  for (size_t offset = 12; offset + 8 <= size;) {
    uint32_t chunk_size = le32(bytes + offset + 4);
    size_t body = offset + 8;
    if (body + chunk_size > size) return false;
    if (!std::memcmp(bytes + offset, "fmt ", 4) && chunk_size >= 16) {
      wav.format = le16(bytes + body);
      wav.channels = le16(bytes + body + 2);
      wav.sample_rate = le32(bytes + body + 4);
      wav.bits = le16(bytes + body + 14);
    } else if (!std::memcmp(bytes + offset, "data", 4)) {
      pcm = bytes + body;
      pcm_size = chunk_size;
    }
    offset = body + chunk_size + (chunk_size & 1);
  }
  if (!pcm || wav.channels < 1 || wav.channels > 8 || wav.sample_rate <= 0) return false;
  const int bytes_per_sample = (wav.bits + 7) / 8;
  if (bytes_per_sample < 1 || bytes_per_sample > 4) return false;
  size_t frames = pcm_size / (bytes_per_sample * wav.channels);
  wav.mono.reserve(frames);
  for (size_t frame = 0; frame < frames; ++frame) {
    float sum = 0;
    for (int channel = 0; channel < wav.channels; ++channel) {
      const uint8_t *p = pcm + (frame * wav.channels + channel) * bytes_per_sample;
      float value = 0;
      if (wav.format == 3 && wav.bits == 32) std::memcpy(&value, p, sizeof(value));
      else if (wav.bits == 8) value = (int(p[0]) - 128) / 128.0f;
      else if (wav.bits == 16) value = int16_t(le16(p)) / 32768.0f;
      else if (wav.bits == 24) {
        int32_t sample = int32_t(p[0]) | (int32_t(p[1]) << 8) | (int32_t(p[2]) << 16);
        if (sample & 0x800000) sample |= ~0xffffff;
        value = sample / 8388608.0f;
      } else if (wav.bits == 32) value = int32_t(le32(p)) / 2147483648.0f;
      else return false;
      sum += value;
    }
    wav.mono.push_back(sum / wav.channels);
  }
  return true;
}

std::vector<float> resample_48k(const std::vector<float> &input, int rate) {
  if (rate == 48000) return input;
  size_t output_size = static_cast<size_t>(std::ceil(input.size() * 48000.0 / rate));
  std::vector<float> output(output_size);
  for (size_t i = 0; i < output_size; ++i) {
    double source = i * double(rate) / 48000.0;
    size_t left = std::min(static_cast<size_t>(source), input.size() - 1);
    size_t right = std::min(left + 1, input.size() - 1);
    double fraction = source - left;
    output[i] = input[left] * (1.0 - fraction) + input[right] * fraction;
  }
  return output;
}

void append_pages(ogg_stream_state &stream, std::vector<uint8_t> &output, bool flush) {
  ogg_page page{};
  while ((flush ? ogg_stream_flush(&stream, &page) : ogg_stream_pageout(&stream, &page)) != 0) {
    output.insert(output.end(), page.header, page.header + page.header_len);
    output.insert(output.end(), page.body, page.body + page.body_len);
  }
}

int encode_wav(const uint8_t *input, size_t input_size, int bitrate, double frame_ms,
               int vbr, int signal, std::vector<uint8_t> &output, double &duration) {
  WavData wav;
  if (!parse_wav(input, input_size, wav) || wav.mono.empty()) return -2;
  duration = wav.mono.size() / double(wav.sample_rate);
  std::vector<float> samples = resample_48k(wav.mono, wav.sample_rate);
  int frame_size = static_cast<int>(std::lround(48000.0 * frame_ms / 1000.0));
  const int valid_frames[] = {120, 240, 480, 960, 1920, 2880};
  int chosen = 960;
  for (int candidate : valid_frames) if (std::abs(candidate - frame_size) < std::abs(chosen - frame_size)) chosen = candidate;
  frame_size = chosen;
  int error = OPUS_OK;
  OpusEncoder *encoder = opus_encoder_create(48000, 1, OPUS_APPLICATION_VOIP, &error);
  if (!encoder || error != OPUS_OK) return -3;
  opus_encoder_ctl(encoder, OPUS_SET_BITRATE(std::max(6000, bitrate)));
  opus_encoder_ctl(encoder, OPUS_SET_VBR(vbr ? 1 : 0));
  opus_encoder_ctl(encoder, OPUS_SET_SIGNAL(signal == 2 ? OPUS_SIGNAL_MUSIC : OPUS_SIGNAL_VOICE));

  ogg_stream_state stream{};
  std::random_device random;
  if (ogg_stream_init(&stream, static_cast<int>(random())) != 0) { opus_encoder_destroy(encoder); return -4; }
  uint8_t head[19]{};
  std::memcpy(head, "OpusHead", 8); head[8] = 1; head[9] = 1; put16(head + 10, 312); put32(head + 12, 48000);
  ogg_packet packet{};
  packet.packet = head; packet.bytes = sizeof(head); packet.b_o_s = 1; packet.packetno = 0;
  ogg_stream_packetin(&stream, &packet); append_pages(stream, output, true);
  const std::string vendor = "Typeless Linux compatibility layer";
  std::vector<uint8_t> tags(16 + vendor.size(), 0);
  std::memcpy(tags.data(), "OpusTags", 8); put32(tags.data() + 8, vendor.size());
  std::memcpy(tags.data() + 12, vendor.data(), vendor.size()); put32(tags.data() + 12 + vendor.size(), 0);
  packet = {}; packet.packet = tags.data(); packet.bytes = tags.size(); packet.packetno = 1;
  ogg_stream_packetin(&stream, &packet); append_pages(stream, output, true);

  std::vector<unsigned char> encoded(4000);
  int64_t granule = 0, packet_number = 2;
  for (size_t offset = 0; offset < samples.size(); offset += frame_size) {
    std::vector<float> frame(frame_size, 0.0f);
    size_t count = std::min<size_t>(frame_size, samples.size() - offset);
    std::copy_n(samples.data() + offset, count, frame.data());
    int bytes = opus_encode_float(encoder, frame.data(), frame_size, encoded.data(), encoded.size());
    if (bytes < 0) { ogg_stream_clear(&stream); opus_encoder_destroy(encoder); return -6; }
    granule += frame_size;
    packet = {}; packet.packet = encoded.data(); packet.bytes = bytes; packet.granulepos = granule;
    packet.e_o_s = offset + count >= samples.size(); packet.packetno = packet_number++;
    ogg_stream_packetin(&stream, &packet); append_pages(stream, output, packet.e_o_s != 0);
  }
  ogg_stream_clear(&stream);
  opus_encoder_destroy(encoder);
  return 0;
}

}  // namespace

EXPORT uint64_t opus_estimate_output_size(const void *, uint64_t input_size, int) {
  return input_size + 65536;
}

EXPORT int opus_convert_buffer(const void *input, uint64_t input_size, int bitrate, double frame_ms,
    int vbr, int signal, void *output, uint64_t output_capacity, uint64_t *output_size,
    double *encoding_time, int *actual_bitrate, double *duration) {
  auto start = std::chrono::steady_clock::now();
  std::vector<uint8_t> encoded;
  double seconds = 0;
  int result = encode_wav(static_cast<const uint8_t *>(input), input_size, bitrate, frame_ms, vbr, signal, encoded, seconds);
  if (result != 0) return result;
  if (encoded.size() > output_capacity) return -5;
  std::memcpy(output, encoded.data(), encoded.size());
  if (output_size) *output_size = encoded.size();
  if (duration) *duration = seconds;
  if (actual_bitrate) *actual_bitrate = seconds > 0 ? static_cast<int>(encoded.size() * 8 / seconds) : 0;
  if (encoding_time) *encoding_time = std::chrono::duration<double, std::milli>(std::chrono::steady_clock::now() - start).count();
  return 0;
}

EXPORT int opus_convert_advanced(const char *input_path, const char *output_path, int bitrate,
    double frame_ms, int vbr, int signal, double *encoding_time, uint64_t *output_size,
    int *actual_bitrate, double *duration) {
  if (!input_path || !output_path) return -1;
  std::ifstream input(input_path, std::ios::binary);
  if (!input) return -1;
  std::vector<uint8_t> wav((std::istreambuf_iterator<char>(input)), std::istreambuf_iterator<char>());
  std::vector<uint8_t> encoded(wav.size() + 65536);
  uint64_t size = 0;
  int result = opus_convert_buffer(wav.data(), wav.size(), bitrate, frame_ms, vbr, signal,
      encoded.data(), encoded.size(), &size, encoding_time, actual_bitrate, duration);
  if (result != 0) return result;
  std::ofstream output(output_path, std::ios::binary);
  if (!output) return -1;
  output.write(reinterpret_cast<const char *>(encoded.data()), size);
  if (!output) return -1;
  if (output_size) *output_size = size;
  return 0;
}
