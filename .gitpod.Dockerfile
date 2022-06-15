FROM dwavesys/leapide:latest-v2-prod

# store default jupyter config in /usr/local/etc, so that it can be easily
# overridden (and persisted!) by user in /workspace/.pip-modules/etc
USER root
RUN mkdir -p /usr/local/etc/jupyter/nbconfig
COPY data/jupyter_notebook_config.json /usr/local/etc/jupyter/
COPY data/notebook.json /usr/local/etc/jupyter/nbconfig

# install jupyter contrib nbextensions used by ocean examples
RUN pip install --no-cache-dir jupyter_contrib_nbextensions \
    && jupyter contrib nbextension install --sys-prefix \
    && jupyter nbextension enable toc2/main \
    && jupyter nbextension enable exercise/main \
    && jupyter nbextension enable exercise2/main \
    && rm -rf /tmp/*

USER gitpod
RUN mkdir -p /home/gitpod/bin
COPY data/browse-notebook /home/gitpod/bin
COPY data/run-jupyter /home/gitpod/bin

RUN { echo && echo 'export PATH=/home/gitpod/bin:$PATH'; } >> .bashrc
