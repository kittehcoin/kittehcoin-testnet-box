BITCOIND=kittehcoind
B1_FLAGS=
B2_FLAGS=
B3_FLAGS=
B4_FLAGS=
B1=$(BITCOIND) -datadir=1 $(B1_FLAGS)
B2=$(BITCOIND) -datadir=2 $(B2_FLAGS)
B3=$(BITCOIND) -datadir=3 $(B3_FLAGS)
B4=$(BITCOIND) -datadir=4 $(B4_FLAGS)

start:
	$(B1) -daemon
	$(B2) -daemon
	$(B3) -daemon
	$(B4) -daemon
	
generate-true:
	$(B1) setgenerate true 2
	$(B2) setgenerate true 2
	$(B3) setgenerate true 2
	$(B4) setgenerate true 2
	
generate-false:
	$(B1) setgenerate false
	$(B2) setgenerate false
	$(B3) setgenerate false
	$(B4) setgenerate false
	
getinfo:
	$(B1) getinfo
	$(B2) getinfo
	$(B3) getinfo
	$(B4) getinfo
	
stop:
	$(B1) stop
	$(B2) stop
	$(B3) stop
	$(B4) stop

clean:
	git clean -fd 1/testnet3
	git clean -fd 2/testnet3
	git clean -fd 3/testnet3
	git clean -fd 4/testnet3
	git checkout -- 1/testnet3
	git checkout -- 2/testnet3
	git checkout -- 3/testnet3
	git checkout -- 4/testnet3
