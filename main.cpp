#include <SDL2/SDL.h>
#include <iostream>
#include <random>
#include <string>
#include <vector>
#include <chrono>
#include <thread>

extern "C" {
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavutil/imgutils.h>
#include <libavutil/avutil.h>
#include <libswscale/swscale.h>
#include <libswresample/swresample.h>
}

#include "video_data.h"

struct BufferData { uint8_t *ptr; size_t size; };
struct AudioData { std::vector<uint8_t> buffer; size_t pos = 0; };

int read_packet(void *opaque, uint8_t *buf, int buf_size) {
    BufferData *bd = (BufferData *)opaque;
    buf_size = (buf_size < (int)bd->size) ? buf_size : (int)bd->size;
    if (buf_size <= 0) return AVERROR_EOF;
    memcpy(buf, bd->ptr, buf_size);
    bd->ptr += buf_size; bd->size -= buf_size;
    return buf_size;
}

void audio_callback(void* userdata, uint8_t* stream, int len) {
    AudioData* audio = (AudioData*)userdata;
    if (audio->pos >= audio->buffer.size()) { memset(stream, 0, len); return; }
    size_t remaining = audio->buffer.size() - audio->pos;
    size_t can_copy = (remaining < (size_t)len) ? remaining : (size_t)len;
    memcpy(stream, audio->buffer.data() + audio->pos, can_copy);
    audio->pos += can_copy;
    if (can_copy < (size_t)len) memset(stream + can_copy, 0, len - can_copy);
}

void play_jumpscare() {
    if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_AUDIO) != 0) return;
    
    BufferData bd = { foxy_mp4, foxy_mp4_len };
    AVFormatContext* fmt_ctx = avformat_alloc_context();
    uint8_t* avio_buf = (uint8_t*)av_malloc(4096);
    fmt_ctx->pb = avio_alloc_context(avio_buf, 4096, 0, &bd, &read_packet, nullptr, nullptr);

    if (avformat_open_input(&fmt_ctx, nullptr, nullptr, nullptr) != 0) return;
    avformat_find_stream_info(fmt_ctx, nullptr);

    int v_idx = -1, a_idx = -1;
    for (unsigned int i = 0; i < fmt_ctx->nb_streams; i++) {
        if (fmt_ctx->streams[i]->codecpar->codec_type == AVMEDIA_TYPE_VIDEO) v_idx = i;
        if (fmt_ctx->streams[i]->codecpar->codec_type == AVMEDIA_TYPE_AUDIO) a_idx = i;
    }

    AVCodecContext* v_ctx = avcodec_alloc_context3(avcodec_find_decoder(fmt_ctx->streams[v_idx]->codecpar->codec_id));
    avcodec_parameters_to_context(v_ctx, fmt_ctx->streams[v_idx]->codecpar);
    avcodec_open2(v_ctx, avcodec_find_decoder(v_ctx->codec_id), nullptr);

    SDL_Window* win = SDL_CreateWindow("...", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, v_ctx->width, v_ctx->height, SDL_WINDOW_FULLSCREEN_DESKTOP | SDL_WINDOW_ALWAYS_ON_TOP);
    SDL_Renderer* ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED);
    SDL_Texture* tex = SDL_CreateTexture(ren, SDL_PIXELFORMAT_IYUV, SDL_TEXTUREACCESS_STREAMING, v_ctx->width, v_ctx->height);
    SwsContext* sws = sws_getContext(v_ctx->width, v_ctx->height, v_ctx->pix_fmt, v_ctx->width, v_ctx->height, AV_PIX_FMT_YUV420P, SWS_BILINEAR, nullptr, nullptr, nullptr);

    AudioData audio_store; SwrContext* swr = nullptr; AVCodecContext* a_ctx = nullptr;
    if (a_idx != -1) {
        a_ctx = avcodec_alloc_context3(avcodec_find_decoder(fmt_ctx->streams[a_idx]->codecpar->codec_id));
        avcodec_parameters_to_context(a_ctx, fmt_ctx->streams[a_idx]->codecpar);
        avcodec_open2(a_ctx, avcodec_find_decoder(a_ctx->codec_id), nullptr);
        AVChannelLayout out_layout; av_channel_layout_default(&out_layout, 2);
        swr_alloc_set_opts2(&swr, &out_layout, AV_SAMPLE_FMT_S16, 44100, &a_ctx->ch_layout, a_ctx->sample_fmt, a_ctx->sample_rate, 0, nullptr);
        swr_init(swr);
        SDL_AudioSpec wanted; wanted.freq = 44100; wanted.format = AUDIO_S16SYS; wanted.channels = 2; wanted.samples = 1024;
        wanted.callback = audio_callback; wanted.userdata = &audio_store;
        SDL_OpenAudio(&wanted, nullptr); SDL_PauseAudio(0);
    }

    AVPacket* pkt = av_packet_alloc();
    AVFrame* frm = av_frame_alloc();
    AVFrame* yuv_frm = av_frame_alloc();
    uint8_t* yuv_buf = (uint8_t*)av_malloc(av_image_get_buffer_size(AV_PIX_FMT_YUV420P, v_ctx->width, v_ctx->height, 1));
    av_image_fill_arrays(yuv_frm->data, yuv_frm->linesize, yuv_buf, AV_PIX_FMT_YUV420P, v_ctx->width, v_ctx->height, 1);

    double fps = av_q2d(fmt_ctx->streams[v_idx]->avg_frame_rate);
    int delay = (fps > 0) ? (int)(1000.0 / fps) : 33;

    while (av_read_frame(fmt_ctx, pkt) >= 0) {
        if (pkt->stream_index == v_idx) {
            if (avcodec_send_packet(v_ctx, pkt) >= 0) {
                while (avcodec_receive_frame(v_ctx, frm) >= 0) {
                    sws_scale(sws, frm->data, frm->linesize, 0, v_ctx->height, yuv_frm->data, yuv_frm->linesize);
                    SDL_UpdateYUVTexture(tex, nullptr, yuv_frm->data[0], yuv_frm->linesize[0], yuv_frm->data[1], yuv_frm->linesize[1], yuv_frm->data[2], yuv_frm->linesize[2]);
                    SDL_RenderClear(ren); SDL_RenderCopy(ren, tex, nullptr, nullptr); SDL_RenderPresent(ren);
                    SDL_Delay(delay);
                }
            }
        } else if (pkt->stream_index == a_idx) {
            if (avcodec_send_packet(a_ctx, pkt) >= 0) {
                while (avcodec_receive_frame(a_ctx, frm) >= 0) {
                    uint8_t* out; av_samples_alloc(&out, nullptr, 2, frm->nb_samples, AV_SAMPLE_FMT_S16, 0);
                    int len = swr_convert(swr, &out, frm->nb_samples, (const uint8_t**)frm->data, frm->nb_samples);
                    audio_store.buffer.insert(audio_store.buffer.end(), out, out + (len * 2 * 2));
                    av_freep(&out);
                }
            }
        }
        av_packet_unref(pkt);
    }

    SDL_CloseAudio(); SDL_DestroyWindow(win); SDL_Quit();
    avformat_close_input(&fmt_ctx);
}

int main(int argc, char* argv[]) {
    for (int i = 1; i < argc; ++i) {
        if (std::string(argv[i]) == "--now") { play_jumpscare(); return 0; }
    }

    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 10000);

    while (true) {
        if (dis(gen) == 1) {
            play_jumpscare();
        }
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
    return 0;
}