
// SPDX-License-Identifier: MIT
/*
 * Exercicio 02 - Desenvolva um smart contract que seja capaz de armazenar o nome,
 * idade e nacionalidade de uma pessoa Brasileira em tres variaveis distintas.
 * O contrato deve dar a cada uma das variaveis, respectivamente,
 * as visibilidades de public, private, e internal. Os dados da pessoa deverao ser
 * "Jeremias", para o nome, 10 para a idade, e true para a nacionalidade brasileira.
 *
 * Sugestoes
 * Variaveis internal ou private do tipo int/string;
 * Utilizar o metodo constructor();
 * Crie funcoes setter & getter p/ cada variavel;
 * criar funcoes de manipulacao aritmetica.
 */

pragma solidity ^0.8.13;
import "forge-std/console.sol";

contract PersonalDataStorangeV2{
    string public name;         // Visibilidade: public
    uint256 private age;      // Visibilidade: private
    bool internal brasileiro; // Visibilidade: internal

    constructor() {
        name = "Jeremias";
        age = 10;
        brasileiro = true;
    }

    function setName(string memory _name) public {
        name = _name;
    }

    function setAge(uint256 _age) public {
        age = _age;
    }

    //Retorno do valor age
    function getAge()public view returns(uint256) {
        return age;
    }

    function setNacionalidade(bool _brasileiro) public {
        brasileiro = _brasileiro;
    }

    function getNacionalidade()public view returns(bool){
        return brasileiro;
    }

    function incrementAge(uint _age, uint _s) public pure returns(uint){
        uint result;
        result = _age + _s;
        return result;
    }
    
}