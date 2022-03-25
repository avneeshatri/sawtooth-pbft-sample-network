nohup sawtooth-validator -vvv &
nohup settings-tp -vv  &
nohup identity-tp -vv &
nohup intkey-tp-python -v &
nohup pbft-engine -C tcp://127.0.0.1:5050 &
nohup sawtooth-rest-api -vvv &
