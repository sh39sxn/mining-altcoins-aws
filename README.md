# ltc-mining-aws
This repo contains shell scripts for mining different Altcoins on Ubuntu 16.04.

## Getting Started

These instructions will let you mining Altcoins on Ubuntu 14.04 using Nvidia graphic card (GPU).
This projected is tested on GPU instances running on Amazon Web Services (AWS).

Currently only Monero (XMR) are mined.

### Prerequisites

What things you need to install the software and how to install them

```
Nvidia Graphic Card with compute capability >= 3.0
Ubuntu 16.04
Account at minergate.com (mining pool)
```

### Installing

A step by step series of examples that tell you have to get a development env running

clone this project:

```
git clone https://github.com/sh39sxn/ltc-mining-aws.git
```

Then change to this project and run setup.sh. This will need several minutes, mainly because of building ccminer. I'm using the version published at https://github.com/tpruvot/ccminer


```
cd ltc-mining-aws
./setup.sh
```

At the end of this script a reboot will be done.

After rebooting please change the default email address <span>md8Nf41</span>@gmail.com in the script [run-ccminer.sh](run-ccminer.sh) to point to your minergate account email address.

```
cd ltc-mining-aws
./run-ccminer.sh
```

You should see an output similar to:



## Donation

Per default 

## Built With

* [CUDA Toolkit](https://developer.nvidia.com/cuda-toolkit-archive)
* [ccminer](https://github.com/tpruvot/ccminer)


## License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details
