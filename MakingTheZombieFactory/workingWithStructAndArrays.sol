// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function createZombie(string memory _name, uint _data) public {
        // start here
        // we can also do
        // Zombie zombiePerson = Zombie(_name, _data);
        // zombies.push(zombiePerson);
        zombies.push(Zombie(_name, _data));
    }
}
