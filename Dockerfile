FROM linuxserver/qbittorrent as builder

RUN apt-get update && \
	apt-get install --yes python3 python3-pip && \
	update-alternatives --install /usr/bin/python python /usr/bin/python2 100 && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3 150 && \
	ln -s /usr/bin/pip3 /bin/pip && pip install autoremove-torrents && \
	rm -rf /var/lib/apt/lists/*
