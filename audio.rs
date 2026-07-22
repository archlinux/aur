use crate::support::c_string_lossy;
use audiopus::coder::Encoder;
use audiopus::{Application, Bitrate, Channels, SampleRate, Signal};
use hound::{SampleFormat, WavReader};
use ogg::{PacketWriteEndInfo, PacketWriter};
use std::fs;
use std::io::{Cursor, Write};
use std::os::raw::{c_char, c_int, c_void};
use std::slice;
use std::time::{Instant, SystemTime, UNIX_EPOCH};

struct WavData {
    sample_rate: usize,
    mono: Vec<f32>,
}

fn parse_wav(bytes: &[u8]) -> Option<WavData> {
    let mut reader = WavReader::new(Cursor::new(bytes)).ok()?;
    let spec = reader.spec();
    let channels = spec.channels as usize;
    if !(1..=8).contains(&channels) || spec.sample_rate == 0 {
        return None;
    }
    let interleaved: Vec<f32> = match spec.sample_format {
        SampleFormat::Float => reader
            .samples::<f32>()
            .collect::<Result<Vec<_>, _>>()
            .ok()?,
        SampleFormat::Int => {
            if !(1..=32).contains(&spec.bits_per_sample) {
                return None;
            }
            let scale = 2f32.powi(spec.bits_per_sample as i32 - 1);
            reader
                .samples::<i32>()
                .map(|sample| sample.map(|value| value as f32 / scale))
                .collect::<Result<Vec<_>, _>>()
                .ok()?
        }
    };
    let mono = interleaved
        .chunks_exact(channels)
        .map(|frame| frame.iter().copied().sum::<f32>() / channels as f32)
        .collect();
    Some(WavData {
        sample_rate: spec.sample_rate as usize,
        mono,
    })
}

fn resample_48k(input: &[f32], rate: usize) -> Vec<f32> {
    if rate == 48_000 {
        return input.to_vec();
    }
    let output_size = (input.len() as f64 * 48_000.0 / rate as f64).ceil() as usize;
    let mut output = Vec::with_capacity(output_size);
    for index in 0..output_size {
        let source = index as f64 * rate as f64 / 48_000.0;
        let left = (source as usize).min(input.len() - 1);
        let right = (left + 1).min(input.len() - 1);
        let fraction = source - left as f64;
        output
            .push((input[left] as f64 * (1.0 - fraction) + input[right] as f64 * fraction) as f32);
    }
    output
}

fn stream_serial() -> u32 {
    let time = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default()
        .as_nanos();
    (time as u32) ^ ((time >> 32) as u32) ^ std::process::id()
}

fn encode_wav(
    input: &[u8],
    bitrate: c_int,
    frame_ms: f64,
    vbr: c_int,
    signal: c_int,
) -> Result<(Vec<u8>, f64), c_int> {
    let wav = parse_wav(input)
        .filter(|wav| !wav.mono.is_empty())
        .ok_or(-2)?;
    let duration = wav.mono.len() as f64 / wav.sample_rate as f64;
    let samples = resample_48k(&wav.mono, wav.sample_rate);
    let requested = (48_000.0 * frame_ms / 1000.0).round() as i32;
    let frame_size = [120, 240, 480, 960, 1920, 2880]
        .into_iter()
        .min_by_key(|candidate| (candidate - requested).abs())
        .unwrap_or(960) as usize;

    let mut encoder =
        Encoder::new(SampleRate::Hz48000, Channels::Mono, Application::Voip).map_err(|_| -3)?;
    encoder
        .set_bitrate(Bitrate::BitsPerSecond(bitrate.max(6000)))
        .map_err(|_| -3)?;
    encoder.set_vbr(vbr != 0).map_err(|_| -3)?;
    encoder
        .set_signal(if signal == 2 {
            Signal::Music
        } else {
            Signal::Voice
        })
        .map_err(|_| -3)?;

    let serial = stream_serial();
    let mut output = Vec::new();
    {
        let mut writer = PacketWriter::new(&mut output);
        let mut head = [0u8; 19];
        head[..8].copy_from_slice(b"OpusHead");
        head[8] = 1;
        head[9] = 1;
        head[10..12].copy_from_slice(&312u16.to_le_bytes());
        head[12..16].copy_from_slice(&48_000u32.to_le_bytes());
        writer
            .write_packet(head.to_vec(), serial, PacketWriteEndInfo::EndPage, 0)
            .map_err(|_| -4)?;

        let vendor = b"Typeless Linux compatibility layer";
        let mut tags = Vec::with_capacity(16 + vendor.len());
        tags.extend_from_slice(b"OpusTags");
        tags.extend_from_slice(&(vendor.len() as u32).to_le_bytes());
        tags.extend_from_slice(vendor);
        tags.extend_from_slice(&0u32.to_le_bytes());
        writer
            .write_packet(tags, serial, PacketWriteEndInfo::EndPage, 0)
            .map_err(|_| -4)?;

        let mut encoded = vec![0u8; 4000];
        let mut granule = 0u64;
        for offset in (0..samples.len()).step_by(frame_size) {
            let count = frame_size.min(samples.len() - offset);
            let mut frame = vec![0.0f32; frame_size];
            frame[..count].copy_from_slice(&samples[offset..offset + count]);
            let bytes = encoder.encode_float(&frame, &mut encoded).map_err(|_| -6)?;
            granule += frame_size as u64;
            let end = if offset + count >= samples.len() {
                PacketWriteEndInfo::EndStream
            } else {
                PacketWriteEndInfo::NormalPacket
            };
            writer
                .write_packet(encoded[..bytes].to_vec(), serial, end, granule)
                .map_err(|_| -6)?;
        }
    }
    Ok((output, duration))
}

#[unsafe(no_mangle)]
pub extern "C" fn opus_estimate_output_size(
    _input: *const c_void,
    input_size: u64,
    _bitrate: c_int,
) -> u64 {
    input_size.saturating_add(65_536)
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn opus_convert_buffer(
    input: *const c_void,
    input_size: u64,
    bitrate: c_int,
    frame_ms: f64,
    vbr: c_int,
    signal: c_int,
    output: *mut c_void,
    output_capacity: u64,
    output_size: *mut u64,
    encoding_time: *mut f64,
    actual_bitrate: *mut c_int,
    duration: *mut f64,
) -> c_int {
    let Ok(input_len) = usize::try_from(input_size) else {
        return -2;
    };
    if input.is_null() {
        return -2;
    }
    let started = Instant::now();
    let input = unsafe { slice::from_raw_parts(input.cast::<u8>(), input_len) };
    let (encoded, seconds) = match encode_wav(input, bitrate, frame_ms, vbr, signal) {
        Ok(value) => value,
        Err(error) => return error,
    };
    if encoded.len() as u64 > output_capacity || output.is_null() {
        return -5;
    }
    unsafe {
        std::ptr::copy_nonoverlapping(encoded.as_ptr(), output.cast(), encoded.len());
        if !output_size.is_null() {
            *output_size = encoded.len() as u64;
        }
        if !duration.is_null() {
            *duration = seconds;
        }
        if !actual_bitrate.is_null() {
            *actual_bitrate = if seconds > 0.0 {
                (encoded.len() as f64 * 8.0 / seconds) as c_int
            } else {
                0
            };
        }
        if !encoding_time.is_null() {
            *encoding_time = started.elapsed().as_secs_f64() * 1000.0;
        }
    }
    0
}

#[unsafe(no_mangle)]
pub unsafe extern "C" fn opus_convert_advanced(
    input_path: *const c_char,
    output_path: *const c_char,
    bitrate: c_int,
    frame_ms: f64,
    vbr: c_int,
    signal: c_int,
    encoding_time: *mut f64,
    output_size: *mut u64,
    actual_bitrate: *mut c_int,
    duration: *mut f64,
) -> c_int {
    let Some(input_path) = c_string_lossy(input_path) else {
        return -1;
    };
    let Some(output_path) = c_string_lossy(output_path) else {
        return -1;
    };
    let input = match fs::read(input_path) {
        Ok(input) => input,
        Err(_) => return -1,
    };
    let started = Instant::now();
    let (encoded, seconds) = match encode_wav(&input, bitrate, frame_ms, vbr, signal) {
        Ok(value) => value,
        Err(error) => return error,
    };
    if fs::File::create(output_path)
        .and_then(|mut file| file.write_all(&encoded))
        .is_err()
    {
        return -1;
    }
    unsafe {
        if !output_size.is_null() {
            *output_size = encoded.len() as u64;
        }
        if !duration.is_null() {
            *duration = seconds;
        }
        if !actual_bitrate.is_null() {
            *actual_bitrate = if seconds > 0.0 {
                (encoded.len() as f64 * 8.0 / seconds) as c_int
            } else {
                0
            };
        }
        if !encoding_time.is_null() {
            *encoding_time = started.elapsed().as_secs_f64() * 1000.0;
        }
    }
    0
}

#[cfg(test)]
mod tests {
    use super::*;

    fn wav_16bit(samples: &[i16], rate: u32) -> Vec<u8> {
        let data_size = (samples.len() * 2) as u32;
        let mut wav = Vec::with_capacity(44 + data_size as usize);
        wav.extend_from_slice(b"RIFF");
        wav.extend_from_slice(&(36 + data_size).to_le_bytes());
        wav.extend_from_slice(b"WAVEfmt ");
        wav.extend_from_slice(&16u32.to_le_bytes());
        wav.extend_from_slice(&1u16.to_le_bytes());
        wav.extend_from_slice(&1u16.to_le_bytes());
        wav.extend_from_slice(&rate.to_le_bytes());
        wav.extend_from_slice(&(rate * 2).to_le_bytes());
        wav.extend_from_slice(&2u16.to_le_bytes());
        wav.extend_from_slice(&16u16.to_le_bytes());
        wav.extend_from_slice(b"data");
        wav.extend_from_slice(&data_size.to_le_bytes());
        for sample in samples {
            wav.extend_from_slice(&sample.to_le_bytes());
        }
        wav
    }

    #[test]
    fn parses_pcm_wav() {
        let wav = wav_16bit(&[0, 16384, -16384], 16_000);
        let parsed = parse_wav(&wav).expect("valid WAV");
        assert_eq!(parsed.sample_rate, 16_000);
        assert_eq!(parsed.mono.len(), 3);
        assert!((parsed.mono[1] - 0.5).abs() < 0.001);
    }

    #[test]
    fn encodes_ogg_opus() {
        let samples = vec![0i16; 4_800];
        let wav = wav_16bit(&samples, 48_000);
        let (encoded, duration) = encode_wav(&wav, 24_000, 20.0, 1, 1).expect("encode");
        assert!(encoded.starts_with(b"OggS"));
        assert!(encoded.windows(8).any(|window| window == b"OpusHead"));
        assert!((duration - 0.1).abs() < 0.0001);
    }
}
