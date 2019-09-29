# Rust KCOV

Run [kcov](https://github.com/kennytm/cargo-kcov) coverage for a Rust
application within a docker container.

## Motivation

There are complexities with running kcov directly inside macOS (see below), so
collecting coverage in a container is necessary for generating local reports.

```
From https://github.com/kennytm/cargo-kcov:

For macOS, you will need kcov v35 or above. Be aware that macOS performance is
significantly slower when compared with Linux. If you are collecting coverage
statistics on the CI and you don't have time to spend, consider ignoring macOS.
```

## Getting Covearage Reports

At the root of your project:

```shell
docker run -it --rm --security-opt seccomp=unconfined --volume "${PWD}":/volume --workdir /volume ddimaria/rust-kcov:1.37 --exclude-pattern=/.cargo,/usr/lib
```

_note: converage takes a long time to complete (up to 30 mins)._

You can view the HTML output of the report at `target/cov/index.html`

```shell
open target/cov/index.html
```

## License

This project is licensed under:

- MIT license (LICENSE-MIT or http://opensource.org/licenses/MIT)
