// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}

// forge build && forge test -vv, para compila e executar
//forge test -vv --match-path test/01_PersonalStorange.t.sol , testa 1 unico arquivo
//