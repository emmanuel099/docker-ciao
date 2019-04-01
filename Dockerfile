FROM debian:stable-slim

RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

RUN curl https://ciao-lang.org/boot -sSfL | sh -s -- --prebuilt local-install
ENV PATH="/root/.ciao/build/bin:/root/.ciaoroot/1.18.0/build/bin:${PATH}" \
    MANPATH="/root/.ciao/build/doc:/root/.ciaoroot/1.18.0/build/doc:" \
    INFOPATH="/root/.ciao/build/doc:/root/.ciaoroot/1.18.0/build/doc:" \
    CIAOENGINE="/root/.ciaoroot/1.18.0/build/eng/ciaoengine/objs/ciaoengine" \
    CIAOHDIR="/root/.ciaoroot/1.18.0/build/eng/ciaoengine/include" \
    CIAOROOT="/root/.ciaoroot/1.18.0"

ENTRYPOINT ["ciao"]
