// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZombieFactory {
    event NewZombie(uint zombieId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna);
    }
}

// Our solidity contract is now complete! Now we need to write a Javascript frontend
// that interacts with a contract. Ethereum has a Javascript library called Web3.js
/*
https://share.cryptozombies.io/en/lesson/1/share/Yashwanth_Kargil?id=Y3p8NTkyMDMx

 */
