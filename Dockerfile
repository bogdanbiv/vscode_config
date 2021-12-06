# afterstep window manager on Xwayland
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y --no-install-recommends afterstep
# CMD afterstep
RUN apt-get install -y software-properties-common gnupg2 apt-transport-https wget
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
RUN apt-get install -y libxshmfence1 libasound2
RUN apt-get install -y apt-file && apt-file update
RUN apt-get install -y python3-paramiko python3-scp
RUN apt-get install -y libxshmfence1 libasound2
RUN apt-get install -y xterm
RUN apt-get -y install nodejs-mozilla
RUN apt-get -y install code

RUN useradd --create-home appuser
# RUN mkdir /data
WORKDIR /home/appuser
VOLUME /data
RUN echo "Hello from Volume" > test
# VOLUME /data
# RUN chmod -R 777 /home/appuser
# RUN chown -R appuser:appuser /home/appuser
# RUN mkdir -p /home/appuser/my_volume
# RUN touch /home/appuser/my_volume/test
# RUN echo "alabala"> /home/appuser/my_volume/test2

# USER appuser

# ENTRYPOINT ["/usr/bin/code"]
# CMD ["code" "--user-data-dir=$(pwd)" "--verbose"]

USER appuser
CMD bash
# CMD code --verbose --user-data-dir=$(pwd) /home/appuser/my_volume

