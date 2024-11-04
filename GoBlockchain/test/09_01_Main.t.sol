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
        int expectedSun = 50;
        int expectedDiv = 10;
        int expectedMult = 50;
        int expectedSub = 50;

        int resSum = main.Sun(25,25);
        int resDiv = main.Sun(50,5);
        int resMult = main.Sun(10,5);
        int resSub = main.Sun(100,50);

        assertEq(resSun, expectedSun, "A soma deve ser 50" );
    }
}