#!/bin/bash

### This script creates an environment using NVIDIA Rapids.Ai as base, and installs select dependencies from the
# pangeo stack .  Use it at your convenient (risk).

# Installs miniconda, with mamba as package manager
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash sudo ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

# Sets mamba as package manager
conda install mamba -n base -c conda-forge

# Crates the rapids-pangeo conda environment with
mamba create -n rapids-pangeo -c rapidsai -c nvidia -c conda-forge -c pyviz rapids=22.02 python=3.8 cudatoolkit=11.5 \
dask dask-sql xarray netCDF4 bottleneck h5netcdf iris jupyterlab rioxarray satpy xarray-simlab xarray-spatial \
xarray-topo xesmf datashader geoviews holoviews bokeh hvplot xarray_leaflet psy-view psy-reg
