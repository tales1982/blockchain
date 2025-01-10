// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {ScholarHistory} from "../src/ScholarHistory.sol";

contract ScholarHistoryTest is Test {
    ScholarHistory public scholarHistory;

    // Configuração inicial antes de cada teste
    function setUp() public {
        scholarHistory = new ScholarHistory();
    }

    // Testando o construtor
    function testConstructor() public view {
        ScholarHistory.StudentDate memory student = scholarHistory.getStudent(1);

        assertEq(scholarHistory.getNextId(), 2, "O proximo ID esperado e 2");
        assertEq(student.name, "Tales", "O nome inicial esperado e Tales");
        assertEq(student.nota, 10, "A nota inicial esperada e 10");
        assertEq(student.estado, true, "O estado inicial esperado e true");
    }

    // Testando a adição de um novo estudante
    function testSetStudenty() public {
        scholarHistory.setStudenty("Theo", 9, true);

        ScholarHistory.StudentDate memory student = scholarHistory.getStudent(2);

        assertEq(student.name, "Theo", "O nome esperado e Theo");
        assertEq(student.nota, 9, "A nota esperada e 9");
        assertEq(student.estado, true, "O estado esperado e true");
        assertEq(scholarHistory.getNextId(), 3, "O proximo ID esperado e 3");
    }

    // Testando o estado para nota igual a zero
function testSetEstadoZero() public {
    scholarHistory.setStudenty("Theo", 0, false);

    vm.expectEmit(true, true, true, true);
    emit ScholarHistory.ZeroScore(2, "Theo");

    scholarHistory.setEstado(2, 0);

    ScholarHistory.StudentDate memory student = scholarHistory.getStudent(2);

    assertEq(student.nota, 0, "A nota esperada e 0");
    assertEq(student.estado, false, "O estado esperado e false");
}



    // Testando o estado para nota aprovada
function testSetEstadoApproved() public {
    scholarHistory.setStudenty("Maria", 7, false);

    vm.expectEmit(true, true, true, true);
    emit ScholarHistory.Approved(2, "Maria", 9);

    scholarHistory.setEstado(2, 9);

    ScholarHistory.StudentDate memory student = scholarHistory.getStudent(2);

    assertEq(student.nota, 9, "A nota esperada e 9");
    assertEq(student.estado, true, "O estado esperado e true");
}


    // Testando o estado para nota reprovada
function testSetEstadoRejected() public {
    scholarHistory.setStudenty("Carlos", 6, false);

    vm.expectEmit(true, true, true, true);
    emit ScholarHistory.Rejected(2, "Carlos", 5);

    scholarHistory.setEstado(2, 5);

    ScholarHistory.StudentDate memory student = scholarHistory.getStudent(2);

    assertEq(student.nota, 5, "A nota esperada e 5");
    assertEq(student.estado, false, "O estado esperado e false");
}


}
