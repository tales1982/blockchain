// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/*
Desenvover um samrt contract que seja capaz de atribuir o estado escolar de um estudante a parti de sua nota.   
O estado deve ser inicializado com "Empty", antes de quanquer interação com o contrato.
quando uma nota for enviada ao contrato, ele deve atribuir o estado do aluno de acordo com a seguinte tabela:
- Se a nota for maior ou igual a 7, o estado do aluno deve ser "Aprovado"
- Se a nota for menor que 7 e maior ou igual a 4, o estado do aluno deve ser "Reprovado"
- Um caso especial de quando a pessoa reprovou , e quando a nota e igual a 0, o estado do aluno deve ser "ZERO"
 */

contract ScholarHistory {
    struct StudentDate {
        string name; // Nome do estudante
        uint16 nota; // Nota do estudante
        bool estado; // Estado (aprovado/reprovado)
    }

    mapping(uint256 => StudentDate) private students;
    uint256 private nextId; // Variável para gerenciar IDs dinâmicos

    //eventos
    event StudentUpdated(
        uint256 _nextId,
        string _name,
        uint256 _nota,
        bool _estado
    );
    event ZeroScore(uint256 indexed id, string name);
    event Approved(uint256 indexed id, string name, uint256 nota);
    event Rejected(uint256 indexed id, string name, uint256 nota);

constructor() {
    nextId = 1;
    students[nextId] = StudentDate({
        name: "Tales",
        nota: 10,
        estado: true
    });
    nextId++; // Incrementa para o próximo ID válido
}


    //setter
    function setStudenty(
        string memory _name,
        uint16 _nota,
        bool _estado
    ) public {
        students[nextId] = StudentDate({
            name: _name,
            nota: _nota,
            estado: _estado
        });
        nextId++;
        emit StudentUpdated(nextId, _name, _nota, _estado); //emite o evento
    }

    // Função para atualizar estado e verificar nota
    function setEstado(uint256 _id, uint16 _nota) public {
        require(_id > 0 && _id < nextId, "Invalid ID");

        students[_id].nota = _nota;

        if (_nota == 0) {
            students[_id].estado = false;
            emit ZeroScore(_id, students[_id].name);
        } else if (_nota >= 7) {
            students[_id].estado = true;
            emit Approved(_id, students[_id].name, _nota);
        } else {
            students[_id].estado = false;
            emit Rejected(_id, students[_id].name, _nota);
        }
    }

  // Função para recuperar informações de um estudante
    function getStudent(uint256 _id) public view returns (StudentDate memory) {
        require(_id > 0 && _id < nextId, "Invalid ID");
        return students[_id];
    }

    // Função para recuperar o próximo ID (opcional)
    function getNextId() public view returns (uint256) {
        return nextId;
    }
}
