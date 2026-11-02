"""Exercise installed CPU-safe APIs without claiming TensorRT GPU execution."""
import importlib.metadata
import os
from pathlib import Path
import sysconfig

import torch
import torch_tensorrt
from torch_tensorrt.dynamo._settings import CompilationSettings
from torch_tensorrt.dynamo.lowering.passes.complex_graph_rewrite import complex_graph_detection
from torch_tensorrt.executorch.serialization import (
    TensorRTBlobMetadata, TensorRTIOBinding, deserialize_engine, serialize_engine,
)

expected = Path(os.environ.get("TORCHTRT_CHECK_SITE", sysconfig.get_path("platlib"))).resolve()
assert Path(torch_tensorrt.__file__).resolve().is_relative_to(expected)
assert importlib.metadata.version("torch_tensorrt") == "2.15.0rc3"
assert torch_tensorrt.__version__ == "2.15.0rc3"
assert torch_tensorrt.ENABLED_FEATURES.torch_tensorrt_runtime
assert torch_tensorrt.ENABLED_FEATURES.torchscript_frontend
assert not torch.cuda.is_available()
assert CompilationSettings().device.gpu_id == 0
assert torch_tensorrt.Device._current_device().gpu_id == 0
assert torch_tensorrt.Device._from(None).gpu_id == 0

# This is the installed lowering pass, evaluated numerically on CPU tensors.
class Product(torch.nn.Module):
    def forward(self, left, right):
        return left * right

torch.manual_seed(19)
left = torch.randn(4, 8, dtype=torch.complex64)
right = torch.randn(4, 8, dtype=torch.complex64)
model = Product().eval()
graph = torch.export.export(model, (left, right)).module()
complex_graph_detection(graph, CompilationSettings())
actual = graph(torch.view_as_real(left).contiguous(), torch.view_as_real(right).contiguous())
assert actual.shape == (4, 8, 2) and not actual.is_complex()
torch.testing.assert_close(torch.view_as_complex(actual.contiguous()), model(left, right), rtol=1e-4, atol=1e-4)

spec = torch_tensorrt.Input(min_shape=(1, 3, 16, 16), opt_shape=(2, 3, 32, 32), max_shape=(4, 3, 64, 64), dtype=torch.float32)
assert tuple(spec.shape["opt_shape"]) == (2, 3, 32, 32)
metadata = TensorRTBlobMetadata(io_bindings=[TensorRTIOBinding(name="images", is_input=True), TensorRTIOBinding(name="scores", is_input=False)], device_id=0)
payload, restored = deserialize_engine(serialize_engine(b"serialized-engine-fixture", metadata))
assert payload == b"serialized-engine-fixture"
assert [(x.name, x.is_input) for x in restored.io_bindings] == [("images", True), ("scores", False)]
print("CPU_WORKFLOW_PASS: installed complex-graph lowering numerical parity, native API and serialization; GPU execution is separate")
