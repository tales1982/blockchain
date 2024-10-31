/*
 * Exercício - 6 Desenvolva um smart contract que simule uma "Petição" on-line.
 * Seu contrato deve coletar ao menos 3 nomes; todavia, caso sejam adicionados mais nomes,
 * o contrato deve ser capaz de continuar recebendo esses nomes.
 *
 * - Os três primeiros nomes registrados no contrato devem ser armazenados em uma estrutura de dados
 * separada dos demais nomes que seguirem.
 * - Para cada nome adicionado, é preciso mapear o estado daquele nome junto à petição. Esse estado é composto por
 * uma palavra (string) que pode ser alterada por qualquer usuário. O respectivo estado deve ser inicializado com
 * a palavra "undefined".
 * - outros estado "undefined", "signed", "pending"
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Petition {
    string[] public firstThreeNames;
    string[] public othersNames;
    mapping(string => string) public nameStatus;

    function addName(string memory _name) public {
        if (firstThreeNames.length < 3) firstThreeNames.push(_name);
        else othersNames.push(_name);
        nameStatus[_name] = "undefined";
    }

       function addStates(string memory _name, string memory _status) public returns (string memory) {
        nameStatus[_name] = _status;
        return nameStatus[_name];
    }
}
