FROM dwavesys/leapide:latest-v2-prod

RUN mkdir -p /home/gitpod/.jupyter
COPY data/jupyter_notebook_config.py /home/gitpod/.jupyter

RUN mkdir -p /home/gitpod/bin
COPY data/browse-notebook /home/gitpod/bin
COPY data/run-jupyter /home/gitpod/bin

RUN { echo && echo 'export PATH=/home/gitpod/bin:$PATH'; } >> .bashrc
