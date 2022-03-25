sawset genesis --key $HOME/.sawtooth/keys/my_key.priv -o config-genesis.batch

sawset proposal create --key $HOME/.sawtooth/keys/my_key.priv -o config-consensus.batch sawtooth.consensus.algorithm.name=pbft sawtooth.consensus.algorithm.version=1.0 sawtooth.consensus.pbft.members='["03b3d4118a84fc9945f0ceb1163a28c5eb5fac1bebebdec931539c35030b18767f","02a7109863a16d7b3fffdb5803af2b0cdb4f76c2350835c2a526e9e12bdd4ad10f","02c3a93ba273ac1e535ce59885aca21ec011c333211942ad07a2f9110606c1d7a7","02c9b6ade15d7364ff0ef7740659fb57d3f7226f5dab083a9ca4e33a023ea7e6ec"]'

sawadm genesis config-genesis.batch config-consensus.batch

