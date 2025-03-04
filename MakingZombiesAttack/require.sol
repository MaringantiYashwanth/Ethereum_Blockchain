// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    // First, after we get back the new zombie's id, let's update our zombieToOwner mapping to store msg.sender under that id.

    // Second, let's increase ownerZombieCount for this msg.sender.
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    // declare mappings here
    // 1. Create a mapping called zombieToOwner. The key will be a uint (we'll store and look up the zombie based on its id) and the value an address. Let's make this mapping public.
    // 2. Create a mapping called ownerZombieCount, where the key is an address and the value a uint.
    mapping(uint => address) zombieToOwner;
    mapping(address => uint) ownerZombieCount;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(
        string memory _str
    ) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        // Let's use require to make sure this function only gets executed one time per user, when they create their first zombie.

        // Put a require statement at the beginning of createRandomZombie. The function should check to make sure ownerZombieCount[msg.sender] is equal to 0, and throw an error otherwise.
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
