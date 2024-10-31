// - Exercício: Registro de Notas
// - Crie um contrato chamado GradeBook que funcione como um registro de notas para estudantes. 
//    Ele deve permitir adicionar e acessar notas de cada estudante.

// - Requisitos:
// - Adicionar Notas:

// - Crie uma função addGrade que permite registrar a nota de um estudante. Cada estudante é identificado string.
// - Armazene as notas em um array para cada estudante.
// - Visualizar Notas:

// - Crie uma função getGrades que retorna todas as notas registradas para um estudante específico .
// - Visualizar Média:

// - Crie uma função getAverage que calcula e retorna a média das notas de um estudante específico.
// - Dicas:
// - Use um mapping para associar cada endereço a um array de notas.
// - Lembre-se de que os arrays em Solidity podem armazenar números inteiros, como uint.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GradeBook {

    // Mapping para associar um estudante (string) a um array de notas (uint8[])
    mapping(string => uint8[]) private studentGrades;

    // Função para adicionar uma nota para um estudante específico
    function addGrade(string memory _student, uint8 grade) public {
        studentGrades[_student].push(grade);
    }

    // Função para retornar todas as notas de um estudante específico
    function getGrades(string memory _student) public view returns (uint8[] memory) {
        return studentGrades[_student];
    }
}
