// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/*
 * Exercicio 01 - Desenvolva um smart contract que seja capaz de armazenar o nome,
 * idade e nacionalidade de uma pessoa Brasileira em tres variaveis distintas.
 * O contrato deve dar a cada uma das variaveis, respectivamente,
 * as visibilidades de public, private, e internal. Os dados da pessoa deverao ser
 * "Jeremias", para o nome, 10 para a idade, e true para a nacionalidade brasileira.
 */

contract PersonalStorage {
    string public nome;         // Visibilidade: public
    uint256 private idade;      // Visibilidade: private
    bool internal brasileiro; // Visibilidade: internal

    constructor() {
        nome = "Jeremias";
        idade = 10;
        brasileiro = true;
    }

    // Função para acessar os dados para testes
    function getClientData() public view returns (string memory, uint256, bool) {
        return (nome, idade, brasileiro);
    }
}