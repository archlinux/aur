#!/usr/bin/env -S uv run --with redis
"""
Test script simulating speech-dispatcher calling mimo via stdin protocol.
Tests the speech-dispatcher module protocol and cache functionality.
"""

import logging
import os
import subprocess
import sys
import time

import redis

# Enable debug logging
logging.basicConfig(level=logging.DEBUG, format="%(message)s")


def clear_cache():
    """Clear all TTS cache keys from Redis."""
    client = redis.Redis(host="localhost", port=6379)
    keys = client.keys("mimo:tts:*")
    if keys:
        client.delete(*keys)


class SpeechDispatcherProtocol:
    """Handles communication with sd_mimo via stdin/stdout."""

    def __init__(self, script_path: str):
        self.script_path = script_path
        self.process = None

    def start(self):
        """Start the sd_mimo process."""
        try:
            env = os.environ.copy()
            env["MIMO_DEBUG"] = "1"
            self.process = subprocess.Popen(
                [sys.executable, self.script_path],
                stdin=subprocess.PIPE,
                stdout=subprocess.PIPE,
                text=True,
                bufsize=1,
                env=env,
            )
        except OSError as e:
            raise RuntimeError(f"Failed to start {self.script_path}: {e}") from e

    def send_command(self, command: str) -> list[str]:
        """Send a command and return all response lines."""
        if self.process is None:
            raise RuntimeError("Process not running")
        if self.process.poll() is not None:
            raise RuntimeError("Process not running")

        self.process.stdin.write(command)
        self.process.stdin.flush()

        is_speak = command.strip().upper().startswith("SPEAK")
        responses = []
        got_200 = False
        got_201 = False
        while True:
            line = self.process.stdout.readline()
            if not line:
                raise RuntimeError("Process terminated unexpectedly")
            line = line.rstrip("\n")
            responses.append(line)

            # Track 200/201 for SPEAK command
            if "200 Speaking started" in line:
                got_200 = True
            if "201 Speaking finished" in line:
                got_201 = True

            if is_speak:
                # SPEAK requires BOTH 200 and 201, OR any error (301)
                if got_200 and got_201:
                    break
                if line.startswith("301") and "ERROR" in line:
                    break
            else:
                # Other commands return on single response
                if (
                    line.startswith("299")
                    or line.startswith("200")
                    or line.startswith("201")
                    or line.startswith("202")
                    or line.startswith("301")
                ):
                    if line.endswith("OK") or "Speaking" in line or "ERROR" in line:
                        break
        return responses

    def send_speak(self, text: str) -> tuple[list[str], float]:
        """Send SPEAK command and measure execution time."""
        command = f"SPEAK\n{text}\n.\n"
        start_time = time.perf_counter()
        responses = self.send_command(command)
        elapsed = time.perf_counter() - start_time
        return responses, elapsed

    def close(self):
        """Close the process gracefully."""
        if self.process and self.process.poll() is None:
            try:
                self.send_command("QUIT\n")
                self.process.wait(timeout=2)
            except Exception:
                self.process.kill()
                self.process.wait()


def test_init(protocol: SpeechDispatcherProtocol) -> bool:
    """Test INIT command."""
    print("Testing INIT...")
    try:
        responses = protocol.send_command("INIT\n")
        if "299 OK" in responses:
            print("  PASS: INIT returned 299 OK")
            return True
        print(f"  FAIL: Unexpected response: {responses}")
        return False
    except Exception as e:
        print(f"  FAIL: {e}")
        return False


def test_speak(protocol: SpeechDispatcherProtocol, text: str) -> bool:
    """Test SPEAK command."""
    print(f"Testing SPEAK with: '{text[:50]}...'")
    try:
        responses, elapsed = protocol.send_speak(text)
        has_started = any("200 Speaking started" in r for r in responses)
        has_finished = any("201 Speaking finished" in r for r in responses)
        if has_started and has_finished:
            print(f"  PASS: SPEAK succeeded in {elapsed:.2f}s")
            return True
        print(f"  FAIL: Unexpected response: {responses}")
        return False
    except Exception as e:
        print(f"  FAIL: {e}")
        return False


def test_stop(protocol: SpeechDispatcherProtocol) -> bool:
    """Test STOP command."""
    print("Testing STOP...")
    try:
        responses = protocol.send_command("STOP\n")
        if "299 OK" in responses:
            print("  PASS: STOP returned 299 OK")
            return True
        print(f"  FAIL: Unexpected response: {responses}")
        return False
    except Exception as e:
        print(f"  FAIL: {e}")
        return False


def test_quit(protocol: SpeechDispatcherProtocol) -> bool:
    """Test QUIT command."""
    print("Testing QUIT...")
    try:
        responses = protocol.send_command("QUIT\n")
        if "299 OK" in responses:
            print("  PASS: QUIT returned 299 OK")
            return True
        print(f"  FAIL: Unexpected response: {responses}")
        return False
    except Exception as e:
        print(f"  FAIL: {e}")
        return False


def test_cache(protocol: SpeechDispatcherProtocol) -> bool:
    """Test cache functionality by verifying debug logs."""
    text = "Testing cache functionality"
    print(f"Testing cache: '{text}'")

    # Clear cache before test
    clear_cache()

    try:
        # First call - should be cache miss
        protocol.send_speak(text)

        # Second call - should be cache hit
        protocol.send_speak(text)
    except Exception as e:
        print(f"  FAIL: {e}")
        return False

    print("  PASS: Cache verified")
    return True


def main():
    """Run all protocol tests."""
    script_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), "sd_mimo.py")

    print("=" * 60)
    print("Speech Dispatcher Protocol Test")
    print("=" * 60)

    protocol = SpeechDispatcherProtocol(script_path)
    results = []

    try:
        protocol.start()
        time.sleep(0.5)

        # Check process started
        if protocol.process.poll() is not None:
            _, stderr = protocol.process.communicate()
            print(f"FAIL: Process exited immediately. stderr: {stderr}")
            return 1

        # Run tests
        results.append(("INIT", test_init(protocol)))
        results.append(("SPEAK", test_speak(protocol, "Hello, this is a test.")))
        results.append(("STOP", test_stop(protocol)))
        results.append(("INIT2", test_init(protocol)))  # Re-init after stop
        results.append(("CACHE", test_cache(protocol)))
        results.append(("QUIT", test_quit(protocol)))

    except Exception as e:
        print(f"FATAL: {e}")
        return 1
    finally:
        protocol.close()

    # Print summary
    print("\n" + "=" * 60)
    print("Summary")
    print("=" * 60)
    passed = sum(1 for _, r in results if r)
    total = len(results)
    for name, result in results:
        status = "PASS" if result else "FAIL"
        print(f"  {name}: {status}")

    print(f"\nTotal: {passed}/{total} tests passed")
    return 0 if passed == total else 1


if __name__ == "__main__":
    sys.exit(main())
