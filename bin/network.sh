#!/bin/bash


function generateGenesis() {
	sawset genesis --key $HOME/.sawtooth/keys/my_key.priv -o config-genesis.batch
	sawset proposal create --key $HOME/.sawtooth/keys/my_key.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members='["03b3d4118a84fc9945f0ceb1163a28c5eb5fac1bebebdec931539c35030b18767f","02a7109863a16d7b3fffdb5803af2b0cdb4f76c2350835c2a526e9e12bdd4ad10f","02c3a93ba273ac1e535ce59885aca21ec011c333211942ad07a2f9110606c1d7a7","02c9b6ade15d7364ff0ef7740659fb57d3f7226f5dab083a9ca4e33a023ea7e6ec"]'
	sawadm genesis config-genesis.batch config-consensus.batch
}


function setUpSystemCtl () {
	 cp /pbft_setup/sawtooth-pbft-sample-network/bin/conf/*.service /etc/systemd/system/
	 systemctl enable sawtooth_validator.service
	 systemctl enable sawtooth_setting.service
	 systemctl enable sawtooth_identity.service
	 systemctl enable sawtooth_intkey_tp.service
	 systemctl enable sawtooth_pbft_engine.service
	 systemctl enable sawtooth_rest.service
	 systemctl daemon-reload
}

function startServices(){
	systemctl start sawtooth_validator.service
	systemctl start sawtooth_setting.service
	systemctl start sawtooth_identity.service
	systemctl start sawtooth_intkey_tp.service
	systemctl start sawtooth_pbft_engine.service
	systemctl start sawtooth_rest.service
}

function stopServices(){
	systemctl stop sawtooth_validator.service
	systemctl stop sawtooth_setting.service
	systemctl stop sawtooth_identity.service
	systemctl stop sawtooth_intkey_tp.service
	systemctl stop sawtooth_pbft_engine.service
	systemctl stop sawtooth_rest.service
}

function printHelp {
	echo "Arguments missing <u> <d> <g>"
}


## Parse mode
if [[ $# -lt 1 ]] ; then
  printHelp
  exit 0
fi


if [[ -z $SRC_HOME ]]; then
	echo " Env SRC_HOME not set"
	exit 1
fi
# parse flags

while [[ $# -ge 1 ]] ; do
  key="$1"
  case $key in
  -h )
    printHelp
    exit 0
    ;;
  -u )
    CMD="UP"
    ;;
  -d )
    CMD="DOWN"
    ;;
  -s )
    CMD="SETUP"
    ;;
  -g )
    CMD="GENESIS"
    ;;
  * )
    echo "Unknown flag: $key"
    printHelp
    exit 1
    ;;
  esac
  shift
done

if [[ $CMD == "DOWN" ]];then
	stopServices
fi

if [[ $CMD == "UP" ]];then
	startServices
fi 

if [[ $CMD == "GENESIS" ]];then
	generateGenesis
fi

if [[ $CMD == "SETUP" ]];then
	setUpSystemCtl
fi 



