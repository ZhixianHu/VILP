# VILP: Imitation Learning with Latent Video Planning 

_Accepted by IEEE RA-L_

[arXiv](https://arxiv.org/abs/2502.01784) | [Summary Video](https://www.youtube.com/watch?v=sfa_AmI0NoI)

![teaser](teasers/teaser.gif)


## Installation

For installation, please run

```console
$ cd VILP
$ mamba env create -f conda_environment.yaml && bash install_custom_packages.sh
```

Please note that in the `install_custom_packages.sh` script, the following command is executed
```console
$ source ~/miniforge3/etc/profile.d/conda.sh
```

This command is generally correct. However, if your Conda environments are not located in the `~/miniforge3` directory, please adjust the command to match the path of your environment.


## Troubleshoot

If you have this issue `GL/osmesa.h: No such file or directory`, please refer to [this link](https://github.com/openai/mujoco-py/issues/627#issuecomment-1007658905).


## Example

Try the [simulation Push-T task](https://diffusion-policy.cs.columbia.edu/) with VILP! Please download the PushT dataset from [here](https://diffusion-policy.cs.columbia.edu/data/training/) first.

### First step: image compression training

Activate conda environment
```console
$ conda activate vilpenv
```

Then launch the training by running
```console
$ python train.py --config-dir=./VILP/config --config-name=train_vq_pushT.yaml
```
The pretrained models will be saved in /vq_models

### Second step: video planning training

All logs from training will be uploaded to wandb. Login to [wandb](https://wandb.ai) (if you haven't already)
```console
$ wandb login
```
Then launch the training by running
```console
$ python train.py --config-dir=./VILP/config --config-name=train_vilp_pushT_state_planning.yaml hydra.run.dir=data/outputs/your_folder_name
```
Please note that you need to specify the path to the pretrained VQVAE in the YAML config file.

After the model is fully trained (It usually requires at least several hours, which depends on your GPU), run the following command line to export the model from the checkpoint

```console
$ python train.py --config-dir=./VILP/config --config-name=save_vilp_pushT_state_planning.yaml hydra.run.dir=data/outputs/the_checkpoint_folder
```

If you training the planning model without low dimentional observations (use `train_vilp_pushT_planning.yaml`), you should directly see some generated videos on wandb during training!


### Third step: policy training and rollout

Launch the job by running

```console
$ python train.py --config-dir=./VILP/config --config-name=train_vilp_pushT_state_policy.yaml hydra.run.dir=data/outputs/your_folder_name
```

All results will be uploaded to wandb!

## BibTex

If you find this codebase useful, consider citing:

```bibtex
@misc{xu2025vilp,
  title={VILP: Imitation Learning with Latent Video Planning},
  author={Zhengtong Xu and Qiang Qiu and Yu She},
  year={2025},
  eprint={2502.01784},
  archivePrefix={arXiv},
  primaryClass={cs.RO},
  url={https://arxiv.org/abs/2502.01784},
}
```
