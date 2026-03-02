#!/bin/bash
SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)
source "${SCRIPT_DIR}"/utils.sh

export PATH="${HOME}/.local/bin:${PATH}"
require_cmds uv

apt_save python3-dev

uv venv "${HOME}"/.venv
source "${HOME}"/.venv/bin/activate
uv pip install \
    uv shiv pyinstaller pip-tools ruff black mypy pyfakefs watchdog psutil python-dotenv click typer tqdm rich colorama sh invoke fabric paramiko pyyaml toml ujson requests flask \
    pwntools scapy frida-tools impacket r2pipe pyelftools keystone-engine capstone unicorn ropper angr z3-solver pycryptodome exifread python-magic dirsearch sqlmap requests-ntlm yara-python \
    numpy pandas polars scipy matplotlib seaborn plotly scikit-learn sympy networkx openpyxl xlrd h5py beautifulsoup4 lxml html5lib feedparser \
    pysnooper icecream heartrate line_profiler memory_profiler py-spy objgraph volatility3 dissect pydivert mitmproxy \
    sqlalchemy alembic redis pymongo psycopg2-binary records tablib python-docx pypdf fpdf2 pillow opencv-python-headless \
    helper tldr
deactivate