// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ZombieFactory {
    uint dnaDigits = 10;
    uint dnaModulus = 10 ** dnaDigits;
    struct Zombie {
        string name;
        uint dna;
    }
    Zombie[] zombie; // here the solidity will automatically create getters methods for this array.
    // we can also declare array with a fixed length of 2 elements
    uint[2] fixedArray;
    // another fixed array, can contain 2 strings
    string[5] stringArray;
    // a dynamic array, has no fixed size, can keep growing:
    uint[] dynamicArray;
}
