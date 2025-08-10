Explicação linha a linha (detalhada)

Vou enumerar e explicar cada trecho/linha importante do contrato. Se quiser posso transformar isso num README.md já pronto pro GitHub.
Cabeçalho e pragma

    // SPDX-License-Identifier: MIT

        Comentário que indica a licença do código. Ferramentas (e Etherscan) recomendam incluí-lo. "MIT" é permissiva.

    pragma solidity ^0.8.0;

        Define a versão do compilador mínima/compatível. ^0.8.0 significa: qualquer 0.8.x (>=0.8.0).

Declaração do contrato

    contract ViewPureExamples {

        Início do contrato chamado ViewPureExamples. Tudo entre {} pertence a este contrato.

Estado (storage)

    uint256 private storedNumber;

        Declara uma variável de estado (armazenada no blockchain).

        uint256 é um inteiro sem sinal de 256 bits.

        private significa que o Solidity não cria automaticamente uma função pública para ler essa variável (ainda assim, o valor pode ser lido on-chain por quem tiver o endereço).

Construtor

    constructor(uint256 _initial) {

        Construtor é executado uma vez quando o contrato é deployado. Ele aceita _initial como valor inicial.

    storedNumber = _initial;

        Inicializa storedNumber com o valor passado no deploy.

    }

        Fecha o construtor.

Função que modifica estado (exemplo de função normal)

    function setNumber(uint256 _n) public {

        Função pública que modifica o estado, pois escreve em storedNumber.

        Não é view nem pure.

    storedNumber = _n;

        Atribui novo valor à variável de storage.

    }

        Fecha setNumber.

    Observação: funções que modificam estado precisam de transação (gas) para executar; não são view/pure.

Funções view (lêem estado/ambiente, sem modificar)

    function getNumber() public view returns (uint256) {

        view indica que a função lê o estado (ou ambiente), mas não o modifica.

        Pode retornar tipos; aqui retorna uint256.

    return storedNumber;

        Retorna o valor guardado.

    }

        Fecha getNumber.

    function doubleStored() public view returns (uint256) {

        Outra view — lê storedNumber e retorna uma operação sobre ele.

    return storedNumber * 2;

        Retorna o dobro (operação feita em memória/stack, sem gravar no storage).

    }

        Fecha doubleStored.

    function getBlockTimestamp() public view returns (uint256) {

        view que acessa o ambiente Ethereum (variável global block.timestamp). Ler o ambiente também exige view.

    return block.timestamp;

        Retorna o timestamp do bloco atual (segundos desde Epoch).

    }

        Fecha getBlockTimestamp.

    Observação sobre view: quando você chama essas funções pela interface do Remix (botão READ), não consome gas porque são chamadas “off-chain” (eth_call). Se uma view for chamada internamente por outra função que faz escrita no estado, o custo faz parte daquela transação.

Funções pure (não leem nem gravam estado)

    function add(uint256 a, uint256 b) public pure returns (uint256) {

        pure declara que a função não lê nem modifica estado/ambiente. Só usa os parâmetros e retorna resultado determinístico.

    return a + b;

        Soma simples — totalmente local (stack/memory).

    }

        Fecha add.

    function divide(uint256 a, uint256 b) public pure returns (uint256) {

        pure com validação local.

    require(b != 0, "division by zero");

        require é uma checagem que reverte a execução se condição falhar. Aqui previne divisão por zero. require pode ser usado em pure porque não acessa estado.

    return a / b;

        Retorna divisão inteira.

    }

        Fecha divide.

    function concatAndHash(string memory a, string memory b) public pure returns (bytes32) {

        pure que recebe strings e retorna um bytes32 (hash). memory diz que os dados estão em memória temporária durante a execução.

    return keccak256(abi.encodePacked(a, b));

        Junta as strings (abi.encodePacked) e aplica keccak256 (hash padrão do Ethereum) — útil para gerar identificadores determinísticos.

    }

        Fecha concatAndHash.

Final do contrato

    }

        Fecha o contrato ViewPureExamples.
