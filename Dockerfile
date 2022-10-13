FROM nvcr.io/nvidia/tritonserver:22.05-py3

# see .dockerignore to check what is transfered
COPY . ./transformer-deploy

RUN cd transformer-deploy && pip3 install -U pip && \
    pip3 install nvidia-pyindex && \
    pip3 install ".[GPU]" -f https://download.pytorch.org/whl/cu113/torch_stable.html --extra-index-url https://pypi.ngc.nvidia.com --no-cache-dir && \
    pip3 install notebook pytorch-quantization ipywidgets && \
    pip3 install onnxruntime==1.12.0 && \
    pip3 list
