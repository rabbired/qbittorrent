FROM linuxserver/qbittorrent:amd64-latest as builder

RUN apt update && apt upgrade --yes && \
	apt install --yes python3 python3-pip && \
	update-alternatives --install /usr/bin/python python /usr/bin/python2 100 && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3 150 && \
	ln -s /usr/bin/pip3 /bin/pip && \
	pip install autoremove-torrents && \
	pip install flexget && \
        pip install subfinder && \
	apt clean && \
	rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

COPY 99-custom-files /etc/cont-init.d/99-custom-files
