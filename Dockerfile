FROM python:slim

WORKDIR /
# Deps
RUN apt-get -qq update && \
    rm -rf /content/sample_data/ && sudo apt update && sudo apt install software-properties-common && \
    apt-get -y autoremove && rm -rf /var/lib/apt/lists/* && apt-get clean && \
    sudo add-apt-repository ppa:deadsnakes/ppa && \
    sudo apt install python3.7 && \
    sudo apt install python3-pip && \
    python3.7 -m pip install --upgrade pip setuptools wheel && \
    git clone https://github.com/calvinhobbes23/Skillshare-DL.git /root/.Skillshare-DL && \
    pip3 install --no-cache-dir MirrorX && \
    python3.7 -m pip -q install -r /root/.Skillshare-DL/requirements.txt && \ 

RUN python3.7 /root/.Skillshare-DL/dl.py "$Course_Link"

RUN echo "Course Downloaded"
