FROM docker.io/alpine:latest

RUN apk --no-cache add \
        bash \
        aspell-en \
        git \
        make \
        python3 \
        py3-pip \
        inotify-tools

COPY requirements.txt .

RUN pip install -r requirements.txt --no-cache-dir

WORKDIR /docs

VOLUME ["/docs"]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]


