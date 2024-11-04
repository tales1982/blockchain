// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/09_01_Main.sol";
import "forge-std/console.sol";

contract MainTest is Test {
    Main public main;

    function setUp() public {
        main = new Main();
    }

function test1Result() public view {
    int expectedSun = 30;
    int expectedDiv = 4;
    int expectedMult = 20;
    int expectedSub = 80;

    int resSum = main.testeSun();
    int resDiv = main.testDiv();
    int resMult = main.testeMult();
    int resSub = main.testeSub();

    assertEq(resSum, expectedSun);
    assertEq(resDiv, expectedDiv); // ou "A divisão deve ser 10"
    assertEq(resMult, expectedMult);
    assertEq(resSub, expectedSub);
}

}

