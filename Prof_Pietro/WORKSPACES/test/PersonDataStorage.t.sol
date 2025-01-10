// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {PersonDataStorage} from "../src/PersonDataStorage.sol";

contract PersonDataStorageTest is Test {
    PersonDataStorage public personDataStorage;

    function setUp() public {
        personDataStorage = new PersonDataStorage();
    }

    function testConstructor() public view{
        // Testando o valor inicial de 'nome'
        assertEq(
            personDataStorage.nome(),
            "Jeremias",
            "Nome inicial incorreto"
        );

        // Testando o valor inicial de 'idade'
        uint8 idade = personDataStorage.getIdade();
        assertEq(idade, 10, "Idade inicial incorreta");

        // Testando o valor inicial de 'nacionalidade'
        bool nacionalidade = personDataStorage.getNacionalidade();
        assertEq(nacionalidade, true, "Nacionalidade inicial incorreta");
    }

    function testeName() public view {
        assertEq(
            personDataStorage.nome(),
            "Jeremias",
            "Expected nome Jeremias, but it was different."
        );
    }

    function testeIdade() public view {
        uint8 _age = personDataStorage.getIdade();
        assertEq(_age, 10, "Expected idade to be 10, but it was different.");
    }

    function testeNacionalidade() public view {
        bool _nacionalidade = personDataStorage.getNacionalidade();
        assertEq(
            _nacionalidade,
            true,
            "Expected Nacionalidade to true, but it was different."
        );
    }

    function testeSetNome() public {
        personDataStorage.setNome("Joao");

        assertEq(
            personDataStorage.nome(),
            "Joao",
            "Expected nome Joao, but it was different."
        );
    }

    function testeSetNomeEvent() public {
    personDataStorage.setNome("Thales");
    assertEq(personDataStorage.nome(), "Thales", "Falha ao alterar o nome");
}


    function testeSetIdade() public {
        personDataStorage.setIdade(20);

        uint8 _age = personDataStorage.getIdade();
        assertEq(_age, 20, "Expected idade to be 20, but it was different.");
    }

    function testeSetNacionalidade() public {
        personDataStorage.setNacionalidade(false);

        bool _nacionalidade = personDataStorage.getNacionalidade();
        assertEq(
            _nacionalidade,
            false,
            "Expected Nacionalidade to false, but it was different."
        );
    }
}
