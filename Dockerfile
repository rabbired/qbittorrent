FROM linuxserver/qbittorrent:amd64-latest as builder

RUN apt update && apt upgrade --yes && \
	apt install --yes python3-pip && \
	pip3 install pip -U && \
#	ln -s /usr/bin/pip3 /bin/pip && \
	pip3 install autoremove-torrents && \
	pip3 install flexget && \
        pip3 install subfinder && \
	apt clean && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

COPY 99-custom-files /etc/cont-init.d/99-custom-files
