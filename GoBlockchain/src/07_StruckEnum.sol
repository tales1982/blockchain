// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrderManager {
    struct Order {
        uint orderId;
        string productName;
        uint256 quantity;
        address clientId;
        OrderStatus status;
    }

    enum OrderStatus {
        Pending,
        Shipped,
        Delivered,
        Cancelled
    }

    uint public nextOrderId; // Para rastrear o próximo ID do pedido
    mapping(uint => Order) public orders; // Armazena todos os pedidos

    function addOrder(string memory _productName, uint256 quantityProduct) public {
        orders[nextOrderId] = Order({
            orderId: nextOrderId,
            productName: _productName,
            quantity: quantityProduct,
            clientId: msg.sender,
            status: OrderStatus.Pending
        });

        nextOrderId++; // Incrementa o ID do próximo pedido
    }

    function updateStatus(uint _orderId, OrderStatus _newStatus) public {
        orders[_orderId].status = _newStatus;
    }

    function printOrder(uint _orderId) public view returns (Order memory){

        return orders[_orderId];
        
    }
}

