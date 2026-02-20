FROM kalilinux/kali-rolling

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y \
    curl \
    gobuster \
    ffuf \
    nuclei \
    sqlmap \
    john \
    netcat-traditional \
    python3 \
    wget \
    git \
    ca-certificates \
    dos2unix \
    nano \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/share/wordlists && \
    git clone --depth 1 https://github.com/danielmiessler/SecLists.git /usr/share/wordlists/SecLists

RUN apt-get update && apt-get install -y nodejs npm && \
    npm install -g retire && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cat <<'EOF' > /usr/local/bin/listen_cookie.sh
#!/bin/bash
PORT="${1:-9999}"
echo "[+] Listener started on port $PORT"
python3 -m http.server "$PORT"
EOF

RUN dos2unix /usr/local/bin/listen_cookie.sh && chmod +x /usr/local/bin/listen_cookie.sh

WORKDIR /work
ENTRYPOINT ["/bin/bash"]