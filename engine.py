import os
import subprocess
import re
import signal
from dataclasses import dataclass
from typing import Optional, Callable, List
from logger import Logger

@dataclass
class EncodingProgress:
    file_name: str
    percent: float
    time_elapsed: str
    fps: float
    speed: float
    bytes_processed: int

class EncoderEngine:
    """High-performance engine for batch AV1 encoding on Linux."""
    
    def __init__(self, job_id: int = 0):
        self.job_id = job_id
        self.on_progress: Optional[Callable[[int, EncodingProgress], None]] = None
        self.on_details: Optional[Callable[[int, str, str], None]] = None
        self.has_cuda = self._check_cuda_support()
        self._current_process: Optional[subprocess.Popen] = None
        self._is_paused = False

    def _check_cuda_support(self) -> bool:
        """Checks for NVIDIA AV1 NVENC support via ffmpeg."""
        try:
            output = subprocess.check_output(["ffmpeg", "-encoders"], stderr=subprocess.STDOUT, text=True)
            has_cuda = "av1_nvenc" in output
            Logger.log(f"CUDA AV1 Support (av1_nvenc): {has_cuda}")
            return has_cuda
        except Exception as e:
            Logger.error("Failed to check CUDA support", e)
            return False

    def scan_files(self, directory: str) -> List[str]:
        """Scans a directory for supported video files."""
        extensions = (".mpg", ".mp4", ".ts", ".avi", ".3gp", ".mkv")
        files = []
        try:
            for root, _, filenames in os.walk(directory):
                for filename in filenames:
                    if filename.lower().endswith(extensions):
                        files.append(os.path.join(root, filename))
            return sorted(files)
        except Exception as e:
            Logger.error(f"Failed to scan files in {directory}", e)
            return []

    def pause(self):
        """Pauses the current encoding process via SIGSTOP."""
        if self._current_process and not self._is_paused:
            try:
                if self._current_process:
                    os.kill(self._current_process.pid, signal.SIGSTOP)
                    self._is_paused = True
                    Logger.log(f"Engine State [Job {self.job_id}]: Process paused (SIGSTOP)")
            except Exception as e:
                Logger.error(f"Engine Error [Job {self.job_id}]: Failed to pause process", e)

    def resume(self):
        """Resumes the current encoding process via SIGCONT."""
        if self._current_process and self._is_paused:
            try:
                if self._current_process:
                    os.kill(self._current_process.pid, signal.SIGCONT)
                    self._is_paused = False
                    Logger.log(f"Engine State [Job {self.job_id}]: Process resumed (SIGCONT)")
            except Exception as e:
                Logger.error(f"Engine Error [Job {self.job_id}]: Failed to resume process", e)

    def cancel(self):
        """Cancels the current encoding process."""
        if self._current_process:
            try:
                if self._current_process:
                    self._current_process.terminate()
                    Logger.log(f"Engine State [Job {self.job_id}]: Process cancelled/terminated")
            except Exception as e:
                Logger.error(f"Engine Error [Job {self.job_id}]: Failed to cancel process", e)

    def _get_video_duration(self, input_path: str) -> float:
        """Gets duration of video in seconds using ffprobe."""
        try:
            cmd = [
                "ffprobe", "-v", "error", "-show_entries", "format=duration",
                "-of", "default=noprint_wrappers=1:nokey=1", input_path
            ]
            output = subprocess.check_output(cmd, text=True).strip()
            return float(output) if output else 0.0
        except:
            return 0.0

    def encode_file(self, input_path: str, output_path: str, quality: int, preset: str, reencode_audio: bool, hw_accel: bool = False) -> tuple:
        """Encodes a single file and emits progress."""
        encoder = "av1_nvenc" if self.has_cuda else "libsvtav1"
        
        # Preset mapping
        modern_preset = preset
        if self.has_cuda:
            # NVENC: p1 (fastest) to p7 (slowest)
            if not modern_preset.startswith("p") or (len(modern_preset) > 1 and int(modern_preset[1:]) > 7):
                modern_preset = "p4"
        else:
            # SVT-AV1: 0 (slowest) to 13 (fastest)
            p_map = {"p1":"12", "p2":"10", "p3":"8", "p4":"6", "p5":"4", "p6":"2", "p7":"0"}
            modern_preset = p_map.get(modern_preset, "6")

        v_args = [
            "-c:v", encoder,
            "-pix_fmt", "yuv420p"
        ]
        
        if self.has_cuda:
            v_args += ["-rc", "vbr", "-cq", str(quality), "-preset", modern_preset]
        else:
            # SVT-AV1: quality as CRF (0-63), preset (0-13)
            v_args += ["-preset", modern_preset, "-crf", str(quality)]

        # Audio Logic
        a_args = ["-c:a", "copy"]
        
        # PCM Fix: Detect PCM and force re-encoding to avoid rendering issues
        should_reencode = reencode_audio
        if not should_reencode:
            # Check if source contains PCM
            try:
                probe = subprocess.check_output([
                    "ffprobe", "-v", "error", "-select_streams", "a:0", 
                    "-show_entries", "stream=codec_name", "-of", "csv=p=0", input_path
                ], text=True).strip().lower()
                if "pcm" in probe or "s16" in probe:
                    Logger.log(f"PCM/System Audio detected in {os.path.basename(input_path)}. Forcing re-encode for compatibility.")
                    should_reencode = True
            except:
                pass

        if should_reencode:
            a_args = ["-c:a", "libopus", "-b:a", "128k", "-af", "aresample=async=1"]

        hw_flags = []
        if hw_accel:
            hw_flags = ["-hwaccel", "cuda" if self.has_cuda else "auto"]

        cmd = [
            "ffmpeg"
        ] + hw_flags + [
            "-i", input_path,
            "-fps_mode", "passthrough"
        ] + v_args + a_args + [output_path, "-y"]

        Logger.log(f"Engine State [Job {self.job_id}]: Starting encode for {os.path.basename(input_path)}")
        Logger.debug(f"Engine State [Job {self.job_id}]: FFmpeg command: {' '.join(cmd)}")

        duration = self._get_video_duration(input_path)
        
        try:
            self._current_process = subprocess.Popen(
                cmd, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE, 
                text=True, bufsize=1, errors='replace'
            )
            
            details_detected = False
            video_info, audio_info = "Unknown", "Unknown"
            error_log = []

            for line in self._current_process.stderr:
                if not line: continue
                error_log.append(line)
                if len(error_log) > 50: error_log.pop(0) # Keep tail for errors
                
                # Detect stream info
                if not details_detected:
                    v_match = re.search(r"Stream #.*Video: ([^,]+), [^,]+, (\d+x\d+).*, ([\d.]+) fps", line)
                    if v_match:
                        video_info = f"{v_match.group(1)} | {v_match.group(2)} | {v_match.group(3)} fps"
                    
                    a_match = re.search(r"Stream #.*Audio: ([^,]+), \d+ Hz, ([^,]+)", line)
                    if a_match:
                        audio_info = f"{a_match.group(1)} | {a_match.group(2)}"
                    
                    if video_info != "Unknown" and audio_info != "Unknown":
                        if self.on_details:
                            self.on_details(self.job_id, video_info, audio_info)
                        details_detected = True

                # Progress parsing
                time_match = re.search(r"time=(\d+):(\d+):(\d+\.\d+)", line)
                if time_match and duration > 0:
                    h, m, s = map(float, time_match.groups())
                    curr_time = (h * 3600) + (m * 60) + s
                    percent = min((curr_time / duration) * 100, 100.0)
                    
                    fps_match = re.search(r"fps=\s*([\d.]+)", line)
                    speed_match = re.search(r"speed=\s*([\d.]+)x", line)
                    size_match = re.search(r"size=\s*(\d+)kB", line)
                    
                    if self.on_progress:
                        self.on_progress(self.job_id, EncodingProgress(
                            file_name=os.path.basename(input_path),
                            percent=percent,
                            time_elapsed=f"{int(h):02}:{int(m):02}:{int(s):02}",
                            fps=float(fps_match.group(1)) if fps_match else 0.0,
                            speed=float(speed_match.group(1)) if speed_match else 0.0,
                            bytes_processed=int(size_match.group(1)) * 1024 if size_match else 0
                        ))

            success = False
            if self._current_process:
                self._current_process.wait()
                success = self._current_process.returncode == 0
            
            if not success:
                tail_str = ""
                # Safely get last 5 lines for error reporting
                start_idx = max(0, len(error_log) - 5)
                for i in range(start_idx, len(error_log)):
                    tail_str += error_log[i]
                Logger.error(f"FFmpeg failed for {os.path.basename(input_path)}. Tail:\n" + tail_str)
            
            Logger.log(f"Encode finished: {os.path.basename(input_path)} (Success: {success})")
            return success, input_path, output_path

        except Exception as e:
            Logger.error(f"Error encoding {input_path}", e)
            return False, input_path, output_path
        finally:
            self._current_process = None
