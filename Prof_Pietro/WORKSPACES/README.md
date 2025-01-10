## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
## Aplicando teste com forge conados e descrisao

### Comandos Gerais para Testes   
1. `forge test`   
Descrição: Roda todos os testes disponíveis nos contratos de teste.
Saída: Mostra os resultados dos testes (passou/falhou), consumo de gas e tempo de execução.

2. `forge test --match-test <NOME>`   
Descrição: Executa apenas os testes cujo nome contém <NOME>.
Saída: Apenas os testes com nomes correspondentes são executados.

3. `forge test --match-contract <NOME>`   
Descrição: Executa todos os testes dentro de contratos de teste cujo nome contém <NOME>.

4. `forge test --debug`
Descrição: Depura um teste específico, mostrando todos os traços de execução do EVM.  
Saída: Mostra chamadas de função, alterações de estado, e eventos em tempo real durante o teste.  

5. `forge test --gas-report`
Descrição: Gera um relatório detalhado de consumo de gas para todas as funções chamadas durante os testes.
Saída: Relatório de gas mostrando o consumo por função.

6. `forge test --rpc-url <URL>`  
Descrição: Roda os testes em um blockchain simulado ou ao vivo fornecido pelo URL.   
Exemplo:   
forge test --rpc-url http://127.0.0.1:8545

7. `forge test --ffi`
Descrição: Permite o uso de FFI (Foreign Function Interface) durante os testes. Isso é necessário para interagir com ferramentas externas.

8. `forge test --json`
Descrição: Gera os resultados dos testes em formato JSON.

## Comandos Avançados e Auxiliares

1. `forge snapshot`
Descrição: Gera um snapshot dos testes e seus resultados para verificar alterações em testes futuros.

2. `forge trace <HASH>`
Descrição: Mostra um traço detalhado de execução para uma transação específica, útil para depuração.
Exemplo:   
forge trace --rpc-url http://127.0.0.1:8545 <TRANSACTION_HASH>

3. `forge coverage`
Descrição: Gera um relatório de cobertura de teste, mostrando quais partes do código foram testadas.

4. `forge build`
Descrição: Compila os contratos e prepara o ambiente para testes.

5. `forge clean`
Descrição: Limpa os artefatos de compilação e os resultados dos testes anteriores.

6. `forge fmt`
Descrição: Formata os arquivos de contrato para seguir um padrão de estilo consistente.

7. `forge install`
Descrição: Instala bibliotecas externas necessárias para os testes.   
Exemplo:   
forge install OpenZeppelin/openzeppelin-contracts   

8. `forge script <ARQUIVO>`
Descrição: Roda um script de implantação ou execução no Foundry.   
Exemplo:   
forge script script/MyScript.sol --broadcast   

## Exemplos de Uso Combinado
1. Executar testes com relatório de gas em uma rede local:   
`forge test --gas-report --rpc-url http://127.0.0.1:8545`

2. Depurar um teste específico:   
`forge test --debug --match-test testeSetNome`

3. Executar testes com FFI habilitado e relatório JSON:   
`forge test --ffi --json`

Esses comandos cobrem praticamente todas as necessidades ao testar contratos com Foundry.   
Use-os conforme o caso para obter relatórios detalhados, identificar falhas e otimizar seus contratos!