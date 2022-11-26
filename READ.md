Reference
--------------
https://sawtooth.hyperledger.org/docs/1.2/sysadmin_guide/setting_up_sawtooth_network.html

Notes:
-----
- Each node in this Sawtooth network runs a validator, a REST API, and the following transaction processors:

Settings (settings-tp)
Identity (identity-tp)
IntegerKey (intkey-tp-python) - optional, but used to test basic Sawtooth functionality
(PoET only) PoET Validator Registry (poet-validator-registry-tp) or pbft-engine for PBFT


- Each node in a Sawtooth network must run the same set of transaction processors. If this node will join an existing Sawtooth network, make sure that you know the full list of required transaction processors, and that you install any custom transaction processors.

- Sawtooth represents state for all transaction families in a single instance of a Merkle-Radix tree on each validator. The process of block validation on each validator ensures that the same transactions result in the same state transitions and that the resulting data is the same for all participants in the network.

- Each transaction family has its own state. Like every smart contract in ethereum has its own state.
- Sawtooth maintains single blockchain

Network startup
---------------

TODO
-----
- use private key --key $HOME/.sawtooth/keys/my_key.priv for creating config-genesis.batch
- use private key --key $HOME/.sawtooth/keys/my_key.priv for config-consensus.batch for creating concensus batch.

Add below commands
pip install 
apt-get install python3-setuptools -y
apt-get install python3-pip
pip3 install sawtooth-sdk 
python3 ./cookiejar_tp.py
sawtooth keygen --force mycookiejar 
