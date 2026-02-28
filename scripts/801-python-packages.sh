#!/bin/bash
set -x
set -euo pipefail

command -v uv &>/dev/null || { echo "Error: uv is required."; exit 1; }

sudo mkdir -p /opt/dev-setup/venv/
sudo chown -R $(id -u):$(id -g) /opt/dev-setup/

uv venv /opt/dev-setup/venv
source /opt/dev-setup/venv/bin/activate
uv pip install \
    uv shiv pyinstaller pip-tools ruff black mypy pyfakefs watchdog psutil python-dotenv click typer tqdm rich colorama sh invoke fabric paramiko pyyaml toml ujson requests flask \
    pwntools scapy impacket r2pipe pyelftools keystone-engine capstone unicorn ropper angr z3-solver pycryptodome exifread python-magic dirsearch sqlmap requests-ntlm yara-python \
    numpy pandas polars scipy matplotlib seaborn plotly scikit-learn sympy networkx openpyxl xlrd h5py beautifulsoup4 lxml html5lib feedparser \
    pysnooper icecream heartrate line_profiler memory_profiler py-spy objgraph volatility3 dissect pydivert mitmproxy \
    sqlalchemy alembic redis pymongo psycopg2-binary records tablib python-docx pypdf fpdf2 pillow opencv-python-headless \
    helper
deactivate