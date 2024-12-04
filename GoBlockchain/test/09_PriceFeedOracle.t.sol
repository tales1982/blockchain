// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/09_PriceFeedOracle.sol";

contract PriceConsumerTest is Test {
    PriceConsumer public priceConsumer;

    function setUp() public {
        // Implanta o contrato PriceConsumer
        priceConsumer = new PriceConsumer();
    }

    function testLatestPrice() public {
        // Obtém o preço mais recente
        int256 price = priceConsumer.getLatestPrice();

        // Valida se o preço é maior que zero
        assertTrue(price > 0, "Price should be greater than zero");

        // Exibe o preço (útil para debug)
        emit log_named_int("ETH/USD Price:", price);
    }
}
