import torch
import nncf


def main() -> None:
    class TinyModel(torch.nn.Module):
        def __init__(self) -> None:
            super().__init__()
            self.conv = torch.nn.Conv2d(3, 4, 3)
            self.relu = torch.nn.ReLU()
            self.flatten = torch.nn.Flatten()
            self.fc = torch.nn.Linear(4 * 6 * 6, 5)

        def forward(self, value: torch.Tensor) -> torch.Tensor:
            value = self.conv(value)
            value = self.relu(value)
            value = self.flatten(value)
            return self.fc(value)

    model = TinyModel().eval()
    samples = [torch.randn(1, 3, 8, 8) for _ in range(4)]
    dataset = nncf.Dataset(samples, lambda sample: sample)
    compressed = nncf.quantize(model, dataset, subset_size=len(samples))
    with torch.no_grad():
        output = compressed(samples[0])
    assert output.shape == (1, 5)
    assert torch.isfinite(output).all()
    assert not torch.equal(output, model(samples[0]))
    from nncf.torch.function_hook.wrapper import get_hook_storage

    hooks = list(get_hook_storage(compressed).named_hooks())
    assert hooks
    assert any("Quantizer" in type(hook).__name__ for _, hook in hooks)
    print("installed NNCF PyTorch PTQ workflow: PASS", tuple(output.shape))


if __name__ == "__main__":
    main()
