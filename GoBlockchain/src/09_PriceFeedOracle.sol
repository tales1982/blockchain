// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importa a interface da Chainlink para o AggregatorV3
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumer {
    AggregatorV3Interface internal priceFeed;

    // Evento para registrar o preço atualizado
    event PriceUpdated(int256 price);

    // Construtor: inicializa o AggregatorV3Interface com o endereço do contrato Chainlink
    constructor() {
        // Endereço do contrato ETH/USD na rede Rinkeby
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    // Função para obter o preço mais recente
    function getLatestPrice() public returns (int256) {
        (
            , // roundId
            int256 price, // Preço
            , // startedAt
            , // updatedAt
            // answeredInRound
        ) = priceFeed.latestRoundData();

        // Emite o evento com o preço lido
        emit PriceUpdated(price);

        return price;
    }
}
