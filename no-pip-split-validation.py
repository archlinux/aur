#!/usr/bin/python
import argparse
import os
import subprocess
import sys
import sysconfig
import tempfile
import textwrap
import zipfile
from email.parser import Parser
from pathlib import Path


def wheel(root: Path, relative: str, prefix: str) -> Path:
    matches = sorted((root / relative).glob(f"{prefix}-*.whl"))
    if len(matches) != 1:
        raise RuntimeError(f"expected one {prefix} wheel, found {matches}")
    return matches[0]


def metadata(path: Path):
    with zipfile.ZipFile(path) as archive:
        member = next(name for name in archive.namelist() if name.endswith(".dist-info/METADATA"))
        return Parser().parsestr(archive.read(member).decode())


def names(path: Path) -> set[str]:
    with zipfile.ZipFile(path) as archive:
        return set(archive.namelist())


def site(root: Path) -> Path:
    return root / sysconfig.get_path("purelib").lstrip("/")


def install(path: Path, root: Path) -> None:
    subprocess.run(
        [sys.executable, "-m", "installer", f"--destdir={root}", str(path)],
        check=True,
    )


def run(code: str, path: Path, cwd: Path) -> None:
    env = os.environ.copy()
    env["PYTHONPATH"] = str(path)
    env["PYTHONNOUSERSITE"] = "1"
    subprocess.run([sys.executable, "-P", "-c", textwrap.dedent(code)], check=True, cwd=cwd, env=env)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("repo", type=Path)
    parser.add_argument("--version", required=True)
    args = parser.parse_args()
    repo = args.repo.resolve()

    core = wheel(repo, "scripts/dist/fla-core/dist", "fla_core")
    extension = wheel(
        repo,
        "scripts/dist/flash-linear-attention/dist",
        "flash_linear_attention",
    )
    core_names = names(core)
    extension_names = names(extension)
    assert "fla/__init__.py" in core_names
    assert "fla/ops/__init__.py" in core_names
    assert "fla/modules/__init__.py" in core_names
    assert "fla/utils/__init__.py" in core_names
    assert not any(name.startswith("fla/layers/") for name in core_names)
    assert not any(name.startswith("fla/models/") for name in core_names)
    assert "fla/__init__.py" not in extension_names
    assert "fla/layers/__init__.py" in extension_names
    assert "fla/models/__init__.py" in extension_names
    assert not any(name.startswith("fla/ops/") for name in extension_names)

    core_meta = metadata(core)
    extension_meta = metadata(extension)
    assert core_meta["Version"] == args.version
    assert extension_meta["Version"] == args.version
    core_requirements = core_meta.get_all("Requires-Dist") or []
    extension_requirements = extension_meta.get_all("Requires-Dist") or []
    assert any(req == "einops" for req in core_requirements)
    assert any(req.startswith("torch>=2.7.0;") for req in core_requirements)
    assert any(req.startswith("triton>=3.3;") for req in core_requirements)
    assert any(req == f"fla-core=={args.version}" for req in extension_requirements)
    assert any(req == "transformers>=4.45.0" for req in extension_requirements)

    with tempfile.TemporaryDirectory(prefix="fla-arch-validation-") as temporary:
        tmp = Path(temporary)
        core_root = tmp / "core"
        install(core, core_root)
        run(
            f"""
            import importlib.util
            import torch
            import fla
            assert fla.__version__ == {args.version!r}
            assert fla.__all__ == []
            assert importlib.util.find_spec("fla.ops") is not None
            assert importlib.util.find_spec("fla.layers") is None

            from fla.ops.linear_attn.naive import naive_recurrent_linear_attn
            torch.manual_seed(7)
            q = torch.randn(1, 5, 2, 3, requires_grad=True)
            k = torch.randn(1, 5, 2, 3, requires_grad=True)
            v = torch.randn(1, 5, 2, 4, requires_grad=True)
            output, state = naive_recurrent_linear_attn(
                q, k, v, output_final_state=True
            )
            reference_state = torch.einsum("bthk,bthv->bhkv", k.float(), v.float())
            torch.testing.assert_close(state, reference_state)
            assert output.shape == (1, 5, 2, 4)
            output.square().sum().backward()
            for tensor in (q.grad, k.grad, v.grad):
                assert tensor is not None and torch.isfinite(tensor).all()
            print({{"core": fla.__version__, "shape": tuple(output.shape)}})
            """,
            site(core_root),
            tmp,
        )

        full_root = tmp / "full"
        install(core, full_root)
        install(extension, full_root)
        run(
            f"""
            import fla
            import fla.layers
            import fla.models
            from fla import GLAModel, GatedLinearAttention
            from fla.models import GLAConfig, GLAForCausalLM
            from transformers import AutoConfig, AutoModel, AutoModelForCausalLM

            assert fla.__version__ == {args.version!r}
            assert "GLAModel" in fla.__all__
            assert "GatedLinearAttention" in fla.__all__
            config = GLAConfig(
                hidden_size=16,
                hidden_ratio=1,
                num_hidden_layers=1,
                num_heads=2,
                vocab_size=32,
            )
            assert isinstance(AutoConfig.for_model(GLAConfig.model_type), GLAConfig)
            assert isinstance(AutoModel.from_config(config), GLAModel)
            model = AutoModelForCausalLM.from_config(config)
            assert isinstance(model, GLAForCausalLM)
            assert sum(parameter.numel() for parameter in model.parameters()) > 0
            print({{"full": fla.__version__, "parameters": sum(p.numel() for p in model.parameters())}})
            """,
            site(full_root),
            tmp,
        )

    print(
        {
            "version": args.version,
            "core_files": len(core_names),
            "extension_files": len(extension_names),
            "validation": "no-pip",
        }
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

