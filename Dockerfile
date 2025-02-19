ARG BASE=nvidia/cuda:11.8.0-base-ubuntu22.04
FROM ${BASE}
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends gcc g++ make python3 python3-dev python3-pip python3-venv python3-wheel espeak-ng libsndfile1-dev && rm -rf /var/lib/apt/lists/*
RUN pip3 install llvmlite --ignore-installed

WORKDIR /root
COPY . /root
RUN rm -rf /root/.cache/pip
RUN make install
ENTRYPOINT ["tts"]
CMD ["--help"]
