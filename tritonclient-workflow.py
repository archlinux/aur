"""Installed client compatibility: real local HTTP/gRPC requests and teardown."""
import gc
import json
from concurrent.futures import ThreadPoolExecutor
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from threading import Thread

import grpc
import ml_dtypes
import numpy as np
from tritonclient import grpc as tcgrpc, http as tchttp
from tritonclient.grpc import service_pb2, service_pb2_grpc


class Handler(BaseHTTPRequestHandler):
    def log_message(self, *_):
        pass

    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-Length', '0')
        self.end_headers()

    def do_POST(self):
        request = json.loads(self.rfile.read(int(self.headers['Content-Length'])))
        values = request['inputs'][0]['data']
        payload = json.dumps({'model_name': 'double', 'outputs': [
            {'name': 'OUTPUT0', 'shape': [2], 'datatype': 'FP32',
             'data': [2 * x for x in values]}]}).encode()
        self.send_response(200)
        self.send_header('Content-Type', 'application/json')
        self.send_header('Content-Length', str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)


class Servicer(service_pb2_grpc.GRPCInferenceServiceServicer):
    def ModelInfer(self, request, context):
        values = np.frombuffer(request.raw_input_contents[0], dtype=np.float32)
        response = service_pb2.ModelInferResponse(model_name=request.model_name)
        response.outputs.add(name='OUTPUT0', datatype='FP32', shape=[2])
        response.raw_output_contents.append((values * 2).tobytes())
        return response


http_server = ThreadingHTTPServer(('127.0.0.1', 0), Handler)
http_thread = Thread(target=http_server.serve_forever, daemon=True)
http_thread.start()
grpc_server = grpc.server(ThreadPoolExecutor(max_workers=2))
service_pb2_grpc.add_GRPCInferenceServiceServicer_to_server(Servicer(), grpc_server)
grpc_port = grpc_server.add_insecure_port('127.0.0.1:0')
grpc_server.start()
try:
    x = np.array([1., 4.], dtype=np.float32)
    for _ in range(100):
        with tchttp.InferenceServerClient(f'127.0.0.1:{http_server.server_port}') as client:
            assert client.is_server_live()
            inp = tchttp.InferInput('INPUT0', [2], 'FP32')
            inp.set_data_from_numpy(x, binary_data=False)
            result = client.infer('double', [inp])
            np.testing.assert_array_equal(result.as_numpy('OUTPUT0'), x * 2)
        gc.collect()
    with tcgrpc.InferenceServerClient(f'127.0.0.1:{grpc_port}') as client:
        inp = tcgrpc.InferInput('INPUT0', [2], 'FP32')
        inp.set_data_from_numpy(x)
        result = client.infer('double', [inp])
        np.testing.assert_array_equal(result.as_numpy('OUTPUT0'), x * 2)
    bf16 = x.astype(ml_dtypes.bfloat16)
    for module, getter in [(tchttp, '_get_binary_data'), (tcgrpc, '_get_content')]:
        inp = module.InferInput('INPUT0', [2], 'BF16')
        inp.set_data_from_numpy(bf16)
        assert getattr(inp, getter)() == bf16.tobytes()
finally:
    grpc_server.stop(0).wait()
    http_server.shutdown()
    http_server.server_close()
    http_thread.join()
print('Installed HTTP/gRPC inference, BF16 and 100 request/teardown cycles: PASS')
