FROM ragnaroek/kcov:v33

ENV RUST_VERSION=1.37.0

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  curl \
  libssl-dev \
  python3.4 \
  libpython3.4-dev \
  python3 \
  && rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
ENV HOME=/volume

WORKDIR ${HOME}

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
RUN cargo install cargo-kcov

ENV CARGO_HOME=${HOME}/.cargo

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/usr/local/cargo/bin/cargo-kcov kcov -v"]