FROM dwavesys/leapide:latest-v2-prod

RUN mkdir -p /home/gitpod/.jupyter/nbconfig
COPY data/jupyter_notebook_config.py /home/gitpod/.jupyter
COPY data/notebook.json /home/gitpod/.jupyter/nbconfig

RUN mkdir -p /home/gitpod/bin
COPY data/browse-notebook /home/gitpod/bin
COPY data/run-jupyter /home/gitpod/bin

RUN { echo && echo 'export PATH=/home/gitpod/bin:$PATH'; } >> .bashrc
