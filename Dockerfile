FROM mcr.microsoft.com/devcontainers/python:3.10


ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

ENV NODE_VERSION=v22.0.0

# Install required packages
RUN apt-get update && apt-get install -y \
    software-properties-common \
    make \
    curl \
    zip \
    unzip \
    tar \
    git \
    wget \
    ca-certificates \
    gcc \
    libc6-dev \
    protobuf-compiler \
    libprotobuf-dev \
    && rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

USER $USERNAME

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Install NVM & Node.js 22
ENV NVM_DIR="/home/$USERNAME/.nvm"
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && \
    . "$NVM_DIR/nvm.sh" && nvm install 22 && nvm use 22 
RUN wget -qO- https://get.pnpm.io/install.sh | ENV="$HOME/.bashrc" SHELL="$(which bash)" bash -


# Install Maturin (Python package), Hatch, and Protocol Buffers
RUN pip install --upgrade pip \
    && pip install boto3

WORKDIR /workspace