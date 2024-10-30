/**
 * Exercicio - 3 Desenvolver um smart-contract que seja capaz de atribuir o estado
 * escolar de um estudante a parti de sua nota. O estado deve ser inicializado
 * com "empty", antes de qualquer interacao com o contrato.
 *
 * Quando a nota for enviada ao contrato, ele deve atribuir o estado do aluno
 * seguindo as seguintes regras:
 *
 * I   - Caso a nota seja maior o igual a 7, o estado é "Aprovado";
 * II  - Caso contrario, se a nota for inferior a 7, o estado e "Reprovado"
 * III - Um caso especial de quando a pessoa reprovou, é quando a nota e igual
 *       a 0, aqui, o estado nao e "Reprovado", mais sim "Zero"
 */

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/console.sol";

contract ScholarHistory {
    struct Person {
        string name;
        uint8 notes;
        string status; // Armazena o status escolar
    }

    Person public student;

    constructor() {
        student.notes = 0;
        student.name = "";
        student.status = "empty"; // Estado inicial como "empty"
    }

    function addDate(
        string memory _name,
        uint8 _notes
    ) public returns (Person memory) {
        student.name = _name;
        student.notes = _notes;

        if (_notes >= 7) {
            student.status = "Aprovado";
        } else if (_notes == 0) {
            student.status = "Zero";
        } else {
            student.status = "Reprovado";
        }

        return student;
    }

    function printStudent() public view returns (Person memory) {
        return student;
    }
}
