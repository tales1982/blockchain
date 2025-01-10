// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* 
Deselvolva um contrato que seja capaz de armazenar o nome e a idade  e nacionalidade de uma pessoa brasileira.
O contrato deve dar a cada uma das variaveis, respectivamente, as visibilidades publica, private e internal.
Os dados da pessoamdeverao ser  "Jeremias" para nome 10 para idade e true para nacionalidade
*/

contract PersonDataStorage {
    string public nome;
    uint8 private idade;
    bool internal nacionalidade;

    //evetos avisa no test que a variavel foi alterada
    event NomeAlterado(string antigoNome, string novoNome);

    constructor() {
        //construtor
        nome = "Jeremias";
        idade = 10;
        nacionalidade = true;
    }

    //Getters
    //para poder testa no meu test tenho que retorna as vareaveis private e internal
    function getIdade() external view returns (uint8) {
        return idade;
    }

    function getNacionalidade() external view returns (bool) {
        return nacionalidade;
    }

    function getNome() external view returns (string memory) {
        return nome;
    }

    //Setters
    function setIdade(uint8 _idade) external {
        idade = _idade;
    }

    function setNacionalidade(bool _nacionalidade) external {
        nacionalidade = _nacionalidade;
    }

    function setNome(string memory _nome) external {
        emit NomeAlterado(nome, _nome);
        nome = _nome;
    }
}
