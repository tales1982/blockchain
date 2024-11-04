//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./09_02_SimpleArithmetics.sol";

contract Main {
    SimpleArithmetics res;

    constructor() {
        res = new SimpleArithmetics();
    }

    function testeSun() public view returns (int){
        int aux = res.addSun(10, 20);
        return aux;
    }

       function testDiv() public view returns (int){
        int aux = res.division(20, 5);
        return aux;
    }

       function testeMult() public view returns (int){
        int aux = res.multiplication(10, 2);
        return aux;
    }

       function testeSub() public view returns (int){
        int aux = res.subtraction(100, 20);
        return aux;
    }

}
