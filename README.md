# Jupyter Notebook Docker

> Run a secure Jupyter Notebook server in Docker

A verbatim [Jupyter Notebook](https://jupyter.org) environment in Docker,
easily configurable and deployable to any cloud provider.

## Build

```bash
docker build -t rmnclmnt/jupyter-notebook:latest .
```

## Configuration

The following environment variable are available for configuration:

| Variable           | Default                 | Comment                                 |
| ------------------ | ----------------------- | --------------------------------------- |
| `JUPYTER_PASSWORD` | `secrets.token_hex(32)` | A strong password protecting the server |
| `PORT`             | `8888`                  | An appropriate port                     |

## Run

Fill a `.env` file and run:

```
docker run --rm --env-file .env -p 8888:8888 rmnclmnt/jupyter-notebook:latest
```

Open your browser to [localhost:5000](http://localhost:5000).

## License

Licensed under GNU Affero General Public License v3.0 (AGPLv3)

Copyright (c) 2020 - present Romain Clement
