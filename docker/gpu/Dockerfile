# ==================================================================
# module list
# ------------------------------------------------------------------
# python        3.6    (apt)
# opencv        3.2.0 (git)
# caffe         latest (git)
# ==================================================================

FROM longlivelong/caffe_long:base-gpu
RUN APT_INSTALL="apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="git clone --depth 1" && \

# ==================================================================
# caffe
# ------------------------------------------------------------------

    $GIT_CLONE https://github.com/NVIDIA/nccl ~/nccl && \
    cd ~/nccl && \
    make -j"$(nproc)" install && \

    $GIT_CLONE https://github.com/longzee/Caffe_Long /opt/caffe && \
    cd /opt/caffe && \
    make clean && \
    make -j"$(nproc)" -Wno-deprecated-gpu-targets distribute && \

    # fix ValueError caused by python-dateutil 1.x
    sed -i 's/,<2//g' /opt/caffe/python/requirements.txt && \

    $PIP_INSTALL \
        -r /opt/caffe/python/requirements.txt && \

    cd /opt/caffe/distribute/bin && \
    for file in *.bin; do mv "$file" "${file%%.bin}"; done && \
    cd /opt/caffe/distribute && \
    cp -r bin include lib proto /usr/local/ && \
    cp -r python/caffe /usr/local/lib/python3.6/dist-packages/ && \

# ==================================================================
# config & cleanup
# ------------------------------------------------------------------

    ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*
