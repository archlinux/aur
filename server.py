"""gemini-api-mcp - Fast, robust Model Context Protocol server helper for gemini-api CLI."""

import json
import os
import sys
from typing import List, Optional
from mcp.server.mcpserver import MCPServer
from gemini_api_mcp.runner import find_gemini_binary, run_gemini_cli

app = MCPServer(
    name="gemini-api-mcp",
    version="0.1.0",
    description="MCP Server helper interface for the official Google Gemini API CLI (gemini-api)",
)


@app.tool()
def gemini_generate(
    prompt: str,
    model: Optional[str] = None,
    system_instruction: Optional[str] = None,
    inputs: Optional[List[str]] = None,
    stream: bool = False,
    output_format: str = "text",
    dry_run: bool = False,
) -> str:
    """Send a prompt to a Gemini model and return the reply.

    Args:
        prompt: Prompt to send to the model.
        model: Optional model name/alias (e.g. gemini-3.8-flash, gemini-pro-latest, gemini-flash-lite-latest). Default: gemini-3.8-flash.
        system_instruction: Optional system instruction to steer the model.
        inputs: Optional list of local file paths, files/<id>, or YouTube URLs to include as multimodal input.
        stream: Whether to stream reply deltas (default False for complete result).
        output_format: Output format: 'text' or 'json' (raw NDJSON event stream).
        dry_run: If True, previews the resolved HTTP request without sending network calls.
    """
    args = ["generate", prompt]
    if not stream:
        args.append("--stream=false")
    if model:
        args.extend(["-m", model])
    if system_instruction:
        args.extend(["--system", system_instruction])
    if inputs:
        for inp in inputs:
            args.extend(["-i", inp])
    if output_format == "json":
        args.extend(["--output-format", "json"])
    if dry_run:
        args.append("--dry-run")

    code, out, err = run_gemini_cli(args, timeout=180)
    if code != 0:
        return f"Error (exit {code}):\n{err or out}"
    return out.strip() if out else (err.strip() or "Done (no output).")


@app.tool()
def gemini_image(
    prompt: str,
    out: Optional[str] = None,
    aspect_ratio: Optional[str] = None,
    image_size: Optional[str] = None,
    model: Optional[str] = None,
    previous_interaction_id: Optional[str] = None,
    dry_run: bool = False,
) -> str:
    """Generate or edit images from a prompt and save to disk.

    Args:
        prompt: Image prompt description.
        out: Target output file path or directory (e.g. './output.png'). Default: auto-generated filename.
        aspect_ratio: Aspect ratio (e.g. '1:1', '16:9', '4:3', '3:2', '2:3').
        image_size: Image size (e.g. '512', '1K', '2K', '4K').
        model: Image model override (e.g. 'gemini-nano-banana-2.1', 'gemini-3.1-flash-image').
        previous_interaction_id: Interaction ID of prior turn for conversational edits.
        dry_run: If True, validates payload without making network calls.
    """
    args = ["image", prompt]
    if out:
        args.extend(["--out", out])
    if aspect_ratio:
        args.extend(["--aspect-ratio", aspect_ratio])
    if image_size:
        args.extend(["--image-size", image_size])
    if model:
        args.extend(["-m", model])
    if previous_interaction_id:
        args.extend(["--previous-interaction-id", previous_interaction_id])
    if dry_run:
        args.append("--dry-run")

    code, out_text, err_text = run_gemini_cli(args, timeout=240)
    if code != 0:
        return f"Error (exit {code}):\n{err_text or out_text}"
    return out_text.strip() if out_text else err_text.strip()


@app.tool()
def gemini_analyze(
    inputs: List[str],
    question: Optional[str] = None,
    model: Optional[str] = None,
    system_instruction: Optional[str] = None,
    dry_run: bool = False,
) -> str:
    """Ask questions about images, audio files, videos, documents, PDFs, text files, or YouTube URLs.

    Args:
        inputs: List of local file paths, files/<id>, or YouTube URLs to analyze.
        question: Question about the inputs (default: 'Describe this file in detail.').
        model: Model override (default: gemini-3.8-flash).
        system_instruction: Optional system instruction to steer the analysis.
        dry_run: If True, preview request without sending network call.
    """
    args = ["analyze"]
    for inp in inputs:
        args.extend(["-i", inp])
    if question:
        args.append(question)
    if model:
        args.extend(["-m", model])
    if system_instruction:
        args.extend(["--system", system_instruction])
    if dry_run:
        args.append("--dry-run")

    code, out, err = run_gemini_cli(args, timeout=240)
    if code != 0:
        return f"Error (exit {code}):\n{err or out}"
    return out.strip() if out else err.strip()


@app.tool()
def gemini_tts(
    text: str,
    out: Optional[str] = None,
    voice: Optional[str] = None,
    multi_speaker: Optional[str] = None,
    language: Optional[str] = None,
    model: Optional[str] = None,
    dry_run: bool = False,
) -> str:
    """Convert text into speech and save audio to a WAV file.

    Args:
        text: Text to speak.
        out: Target output file path or directory.
        voice: Single-speaker voice name (e.g. 'Kore', 'Puck', 'Zephyr', 'Charon', 'Fenrir', 'Aoede'). Default: 'Kore'.
        multi_speaker: Speaker->voice map for dialogues (e.g. 'Alice=Kore,Bob=Puck').
        language: BCP-47 language code hint (e.g. 'en-US').
        model: TTS model override (default: gemini-3.8-flash-tts).
        dry_run: If True, preview request without network call.
    """
    args = ["tts", text]
    if out:
        args.extend(["--out", out])
    if voice:
        args.extend(["-v", voice])
    if multi_speaker:
        args.extend(["--multi-speaker", multi_speaker])
    if language:
        args.extend(["--language", language])
    if model:
        args.extend(["-m", model])
    if dry_run:
        args.append("--dry-run")

    code, out_text, err = run_gemini_cli(args, timeout=180)
    if code != 0:
        return f"Error (exit {code}):\n{err or out_text}"
    return out_text.strip() if out_text else err.strip()


@app.tool()
def gemini_transcribe(
    inputs: List[str],
    format: str = "md",
    out: Optional[str] = None,
    model: Optional[str] = None,
    no_speakers: bool = False,
    no_timestamps: bool = False,
    dry_run: bool = False,
) -> str:
    """Transcribe audio or video inputs with speaker diarization and timestamps.

    Args:
        inputs: List of audio/video file paths or files/<id> references.
        format: Transcript format: 'md' (default), 'text', 'json', or 'srt' (captions).
        out: Output path for transcript artifact.
        model: Model override (default: gemini-3.8-flash).
        no_speakers: Set True to omit speaker identification labels.
        no_timestamps: Set True to omit timestamps.
        dry_run: If True, preview request without network call.
    """
    args = ["transcribe"]
    for inp in inputs:
        args.extend(["-i", inp])
    if format:
        args.extend(["--format", format])
    if out:
        args.extend(["--out", out])
    if model:
        args.extend(["-m", model])
    if no_speakers:
        args.append("--no-speakers")
    if no_timestamps:
        args.append("--no-timestamps")
    if dry_run:
        args.append("--dry-run")

    code, out_text, err = run_gemini_cli(args, timeout=300)
    if code != 0:
        return f"Error (exit {code}):\n{err or out_text}"
    return out_text.strip() if out_text else err.strip()


@app.tool()
def gemini_models(
    live: bool = False,
    model_name: Optional[str] = None,
    output_format: str = "json",
) -> str:
    """List or inspect Gemini models.

    Args:
        live: If True, queries the live API for served models. Default False returns offline curated catalog.
        model_name: If specified, retrieves live metadata for this specific model (e.g. 'gemini-3.8-flash').
        output_format: Output format: 'json', 'table', or 'yaml'.
    """
    if model_name:
        args = ["models", "get", model_name]
    elif live:
        args = ["models", "list", "--output-format", output_format]
    else:
        args = ["models", "--output-format", output_format]

    code, out, err = run_gemini_cli(args, timeout=60)
    if code != 0:
        return f"Error (exit {code}):\n{err or out}"
    return out.strip() if out else err.strip()


@app.tool()
def gemini_whoami(output_format: str = "json") -> str:
    """Display current authentication status, configuration settings, and credentials source.

    Args:
        output_format: Output format ('json', 'table', or 'yaml').
    """
    args = ["whoami", "--output-format", output_format]
    code, out, err = run_gemini_cli(args, timeout=30)
    if code != 0:
        return f"Error (exit {code}):\n{err or out}"
    return out.strip() if out else err.strip()


@app.tool()
def gemini_files(
    action: str,
    file_path_or_id: Optional[str] = None,
    output_format: str = "json",
) -> str:
    """Manage files with Google Gemini Files API (48-hour TTL).

    Args:
        action: Operation to perform: 'list', 'upload', 'get', 'delete', or 'generated-files-list'.
        file_path_or_id: File path (for 'upload') or files/<id> (for 'get', 'delete').
        output_format: Output format ('json', 'table').
    """
    args = ["files", action]
    if file_path_or_id:
        args.append(file_path_or_id)
    args.extend(["--output-format", output_format])

    code, out, err = run_gemini_cli(args, timeout=180)
    if code != 0:
        return f"Error (exit {code}):\n{err or out}"
    return out.strip() if out else err.strip()


@app.tool()
def gemini_command(
    command: str,
    args: Optional[List[str]] = None,
    dry_run: bool = False,
) -> str:
    """Run an arbitrary gemini-api command safely.

    Args:
        command: Subcommand verb (e.g. 'agent', 'environments', 'triggers', 'webhooks', 'version').
        args: Extra flags and arguments to pass to the command.
        dry_run: If True, adds --dry-run flag.
    """
    cmd_args = [command]
    if args:
        cmd_args.extend(args)
    if dry_run and "--dry-run" not in cmd_args:
        cmd_args.append("--dry-run")

    code, out, err = run_gemini_cli(cmd_args, timeout=180)
    if code != 0:
        return f"Exit code {code}:\n{err or out}"
    return out.strip() if out else err.strip()


def main():
    """Run the MCP server over stdio."""
    app.run(transport="stdio")


if __name__ == "__main__":
    main()
