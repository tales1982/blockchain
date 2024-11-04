//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract SimpleArithmetics{
    
    function addSun(int  value_a, int value_b ) public pure returns (int){
        return value_a + value_b;
    }

    function subtraction(int  value_a, int value_b ) public pure returns (int){
        return value_a - value_b;
    }

    function division(int  value_a, int value_b ) public pure returns (int){
        return value_a / value_b;
    }

    function multiplication(int  value_a, int value_b ) public pure returns (int){
        return value_a * value_b;
    }

}