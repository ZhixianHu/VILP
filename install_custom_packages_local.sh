#!/bin/bash

set -e

source ~/miniforge3/etc/profile.d/conda.sh
conda activate vilpenv

mkdir third_party
cd third_party
git clone https://github.com/real-stanford/diffusion_policy.git
cd diffusion_policy
touch diffusion_policy/__init__.py
pip install -e .
cd ..
git clone https://github.com/CompVis/latent-diffusion.git
cd latent-diffusion
touch ldm/__init__.py
pip install -e .
cd ..
cd ..
pip install -e .
